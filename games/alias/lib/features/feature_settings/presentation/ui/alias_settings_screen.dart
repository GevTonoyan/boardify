import 'dart:async';
import 'package:app_core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AliasSettingsScreen extends StatefulWidget {
  const AliasSettingsScreen({super.key});

  @override
  State<AliasSettingsScreen> createState() => _AliasSettingsScreenState();
}

class _AliasSettingsScreenState extends State<AliasSettingsScreen> {
  int gameDuration = 60;
  int pointsToWin = 30;
  bool soundEnabled = true;

  bool allowSkipping = true;
  bool skipPenalty = true;

  int wordsPerCard = 5;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final colors = theme.colors;
    final text = theme.typography;

    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.alias_settings, style: text.titleLarge)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  context.localizations.alias_settings_general,
                  style: text.titleMedium.copyWith(color: colors.primary),
                ),
              ),

              _SettingStepper(
                label: context.localizations.alias_settings_gameDuration,
                value: gameDuration,
                min: 30,
                max: 180,
                onChanged: (v) => setState(() => gameDuration = v),
              ),

              _SettingStepper(
                label: context.localizations.alias_settings_pointsToWin,
                value: pointsToWin,
                min: 10,
                max: 100,
                onChanged: (v) => setState(() => pointsToWin = v),
              ),

              Card(
                child: SwitchListTile(
                  title: Text(
                    context.localizations.alias_settings_soundEffects,
                    style: text.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  value: soundEnabled,
                  onChanged: (v) => setState(() => soundEnabled = v),
                  activeColor: colors.primary,
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  context.localizations.alias_singleWordMode,
                  style: text.titleMedium.copyWith(color: colors.primary),
                ),
              ),
              Card(
                child: SwitchListTile(
                  title: Text(
                    context.localizations.alias_settings_allowSkipping,
                    style: text.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  value: allowSkipping,
                  onChanged: (v) => setState(() => allowSkipping = v),
                  activeColor: colors.primary,
                ),
              ),
              Card(
                child: SwitchListTile(
                  title: Text(
                    context.localizations.alias_settings_penaltyForSkipping,
                    style: text.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  value: skipPenalty,
                  onChanged: (v) => setState(() => skipPenalty = v),
                  activeColor: colors.primary,
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  context.localizations.alias_mode2,
                  style: text.titleMedium.copyWith(color: colors.primary),
                ),
              ),
              _SettingStepper(
                label: context.localizations.alias_settings_wordsPerCard,
                value: wordsPerCard,
                min: 3,
                max: 10,
                onChanged: (v) => setState(() => wordsPerCard = v),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingStepper extends StatefulWidget {
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const _SettingStepper({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  State<_SettingStepper> createState() => _SettingStepperState();
}

class _SettingStepperState extends State<_SettingStepper> {
  Timer? _holdTimer;

  void _startChanging(bool increment) {
    _changeValue(increment);
    _holdTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      _changeValue(increment);
    });
  }

  void _stopChanging() {
    _holdTimer?.cancel();
  }

  void _changeValue(bool increment) {
    final newValue = increment ? widget.value + 1 : widget.value - 1;
    if (newValue >= widget.min && newValue <= widget.max) {
      widget.onChanged(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = context.appTheme.typography;
    final colors = context.appTheme.colors;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.label, style: text.bodyMedium.copyWith(color: colors.onSurface)),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _changeValue(false),
                  onLongPressStart: (_) => _startChanging(false),
                  onLongPressEnd: (_) => _stopChanging(),
                  child: Icon(Icons.remove_circle_outline, color: colors.primary),
                ),
                const SizedBox(width: 12),
                Text('${widget.value}', style: text.bodyMedium.copyWith(color: colors.onSurface)),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => _changeValue(true),
                  onLongPressStart: (_) => _startChanging(true),
                  onLongPressEnd: (_) => _stopChanging(),
                  child: Icon(Icons.add_circle_outline, color: colors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stopChanging();
    super.dispose();
  }
}
