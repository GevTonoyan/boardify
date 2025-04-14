import 'dart:async';
import 'package:alias/core/constants.dart';
import 'package:alias/features/feature_settings/presentation/bloc/alias_settings_bloc.dart';
import 'package:alias/features/feature_settings/presentation/bloc/alias_settings_event.dart';
import 'package:alias/features/feature_settings/presentation/bloc/alias_settings_state.dart';
import 'package:app_core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AliasSettingsScreen extends StatefulWidget {
  const AliasSettingsScreen({super.key});

  @override
  State<AliasSettingsScreen> createState() => _AliasSettingsScreenState();
}

class _AliasSettingsScreenState extends State<AliasSettingsScreen> {
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
          child: BlocBuilder<AliasSettingsBloc, AliasSettingsLoaded>(
            bloc: context.read<AliasSettingsBloc>()..add(GetAliasSettings()),
            builder: (context, state) {
              final bloc = context.read<AliasSettingsBloc>();
              final aliasSettings = state.aliasSettings;

              return ListView(
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
                    value: aliasSettings.gameDuration,
                    min: AliasConstants.minGameDuration,
                    max: AliasConstants.maxGameDuration,
                    onChanged: (int value, {bool persist = true}) {
                      bloc.add(ChangeGameDuration(gameDuration: value, persist: persist));
                    },
                  ),
                  _SettingStepper(
                    label: context.localizations.alias_settings_pointsToWin,
                    value: aliasSettings.pointsToWin,
                    min: AliasConstants.minPointsToWin,
                    max: AliasConstants.maxPointsToWin,
                    onChanged: (int value, {bool persist = true}) {
                      bloc.add(ChangePointsToWin(pointsToWin: value, persist: persist));
                    },
                  ),
                  Card(
                    child: SwitchListTile(
                      title: Text(
                        context.localizations.alias_settings_soundEffects,
                        style: text.bodyMedium.copyWith(color: colors.onSurface),
                      ),
                      value: aliasSettings.soundEnabled,
                      onChanged: (v) {
                        bloc.add(ChangeSoundEffects(v));
                      },
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
                      value: aliasSettings.allowSkipping,
                      onChanged: (v) {
                        bloc.add(ChangeAllowSkipping(v));
                      },
                      activeColor: colors.primary,
                    ),
                  ),
                  Card(
                    child: SwitchListTile(
                      title: Text(
                        context.localizations.alias_settings_penaltyForSkipping,
                        style: text.bodyMedium.copyWith(color: colors.onSurface),
                      ),
                      value: aliasSettings.penaltyForSkipping,
                      onChanged: (v) {
                        bloc.add(ChangePenaltyForSkipping(v));
                      },
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
                    value: aliasSettings.wordsPerCard,
                    min: AliasConstants.minWordsPerCard,
                    max: AliasConstants.maxWordsPerCard,
                    onChanged: (int value, {bool persist = true}) {
                      bloc.add(ChangeWordsPerCard(wordsPerCard: value, persist: persist));
                    },
                  ),
                ],
              );
            },
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
  final void Function(int value, {bool persist}) onChanged;

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
  int _lastValue = 0;

  void _startChanging(bool increment) {
    _changeValue(increment, persist: false);
    _holdTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
      _changeValue(increment, persist: false);
    });
  }

  void _stopChanging() {
    _holdTimer?.cancel();
    _holdTimer = null;
    if (_lastValue != widget.value) {
      widget.onChanged(widget.value, persist: true);
    }
  }

  void _changeValue(bool increment, {required bool persist}) {
    final next = increment ? widget.value + 1 : widget.value - 1;
    if (next >= widget.min && next <= widget.max) {
      _lastValue = widget.value;
      widget.onChanged(next, persist: persist);
    }
  }

  @override
  void dispose() {
    _stopChanging();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = context.appTheme.typography;
    final colors = context.appTheme.colors;

    final bool canDecrement = widget.value > widget.min;
    final bool canIncrement = widget.value < widget.max;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.label, style: text.bodyMedium.copyWith(color: colors.onSurface)),
            ),
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _changeValue(false, persist: true),
                    onLongPressStart: (_) => _startChanging(false),
                    onLongPressEnd: (_) => _stopChanging(),
                    child: Icon(
                      Icons.remove_circle,
                      size: 32,
                      color: canDecrement ? colors.primary : colors.outline,
                    ),
                  ),
                  Text(
                    '${widget.value}',
                    style: text.titleMedium.copyWith(color: colors.onSurface),
                  ),
                  GestureDetector(
                    onTap: () => _changeValue(true, persist: true),
                    onLongPressStart: (_) => _startChanging(true),
                    onLongPressEnd: (_) => _stopChanging(),
                    child: Icon(
                      Icons.add_circle,
                      size: 32,
                      color: canIncrement ? colors.primary : colors.outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
