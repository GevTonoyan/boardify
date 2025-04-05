import 'package:app_core/ui_kit/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAssetPath;

  const GameCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeProvider.of(context).colors;
    final textStyles = AppThemeProvider.of(context).typography;

    return Card(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.outline),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      // for image clipping
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on top
          AspectRatio(aspectRatio: 1 / 1, child: Image.asset(imageAssetPath, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textStyles.titleLarge.copyWith(color: colors.onSurface)),
                const SizedBox(height: 8),
                Text(description, style: textStyles.bodyMedium.copyWith(color: colors.onSurface)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
