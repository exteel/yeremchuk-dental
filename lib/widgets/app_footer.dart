import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    required this.logoText,
    required this.rating,
    required this.reviewCount,
    required this.cities,
    required this.linkColumns,
    required this.phone,
    required this.email,
    required this.socialLinks,
    super.key,
  });

  final String logoText;
  final double rating;
  final int reviewCount;
  final List<String> cities;
  final Map<String, List<({String label, VoidCallback onTap})>> linkColumns;
  final String phone;
  final String email;
  final List<({IconData icon, VoidCallback onTap})> socialLinks;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.navy,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xxl,
            horizontal: AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      logoText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.teal.withValues(alpha: 0.2),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.cardRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.teal,
                          size: 18,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          '$rating ($reviewCount)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: AppColors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                children: cities.map(
                  (city) {
                    return Chip(
                      label: Text(
                        city,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: AppColors.tealSoft,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.chipRadius,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: AppSpacing.xl),
              Wrap(
                spacing: AppSpacing.xl,
                runSpacing: AppSpacing.lg,
                children: linkColumns.entries.map(
                  (entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          entry.key,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        ...entry.value.map(
                          (link) {
                            return TextButton(
                              onPressed: link.onTap,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                link.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: AppSpacing.xl),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    phone,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SelectableText(
                    email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: socialLinks.map(
                  (social) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.md),
                      child: CircleAvatar(
                        backgroundColor: AppColors.teal.withValues(alpha: 0.2),
                        child: IconButton(
                          icon: Icon(
                            social.icon,
                            color: AppColors.teal,
                          ),
                          onPressed: social.onTap,
                          splashRadius: 20,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.06,
                child: Text(
                  logoText,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 96,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
