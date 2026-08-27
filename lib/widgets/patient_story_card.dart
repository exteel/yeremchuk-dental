import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class PatientStoryCard extends StatelessWidget {
  const PatientStoryCard({
    required this.imagePath,
    required this.name,
    required this.metaLine,
    required this.quote,
    required this.detailsLabel,
    required this.onDetailsTap,
    this.showPlayIcon = true,
    this.onPlayTap,
    super.key,
  });

  final String imagePath;
  final String name;
  final String metaLine;
  final String quote;
  final String detailsLabel;
  final VoidCallback onDetailsTap;
  final bool showPlayIcon;
  final VoidCallback? onPlayTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        color: AppColors.paper,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageSection(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metaLine,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  quote,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.md),
                GestureDetector(
                  onTap: onDetailsTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detailsLabel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.teal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: AppColors.teal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: imagePath.isEmpty
              ? Container(
                  color: AppColors.cardBg,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppColors.muted,
                    size: 48,
                  ),
                )
              : imagePath.startsWith('http')
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            color: AppColors.cardBg,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.image_not_supported,
                              color: AppColors.muted,
                              size: 48,
                            ),
                          ),
                    )
                  : Container(
                      color: AppColors.cardBg,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.muted,
                        size: 48,
                      ),
                    ),
        ),
        if (showPlayIcon)
          Positioned.fill(
            child: GestureDetector(
              onTap: onPlayTap,
              child: Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
