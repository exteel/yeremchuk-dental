import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/google_logo.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    required this.authorName,
    required this.date,
    required this.rating,
    required this.text,
    this.serviceTag,
    this.doctorName,
    this.avatarColor,
    super.key,
  });

  final String authorName;
  final String date;
  final int rating;
  final String text;
  final String? serviceTag;
  final String? doctorName;
  final Color? avatarColor;

  Color _getAvatarColor() {
    if (avatarColor != null) {
      return avatarColor!;
    }

    final colors = [
      AppColors.teal,
      AppColors.navy,
      AppColors.amber,
    ];

    final index = authorName.hashCode.abs() % colors.length;
    return colors[index];
  }

  String _getFirstLetter() {
    return authorName.isNotEmpty ? authorName[0].toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    final color = _getAvatarColor();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Text(
                  _getFirstLetter(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const GoogleLogo(),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              ...List.generate(
                rating,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: AppSpacing.xs),
                  child: Icon(
                    Icons.star_rounded,
                    color: AppColors.amber,
                    size: 16,
                  ),
                ),
              ),
              ...List.generate(
                5 - rating,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: AppSpacing.xs),
                  child: Icon(
                    Icons.star_outline_rounded,
                    color: AppColors.amber,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            text,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (serviceTag != null) ...[
            const SizedBox(height: AppSpacing.md),
            const Divider(
              color: AppColors.line,
              height: 1,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                Text(
                  serviceTag!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (doctorName != null)
                  Text(
                    doctorName!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
