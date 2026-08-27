import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    required this.logoText,
    required this.cities,
    required this.selectedCity,
    required this.onCityChanged,
    required this.onConsultationTap,
    required this.consultationLabel,
    this.navItems,
    this.onMenuTap,
    super.key,
  });

  final String logoText;
  final List<String> cities;
  final String selectedCity;
  final ValueChanged<String> onCityChanged;
  final VoidCallback onConsultationTap;
  final String consultationLabel;
  final List<({String label, VoidCallback onTap})>? navItems;
  final VoidCallback? onMenuTap;

  static const _tagline = 'ПРОСТІР ЦИФРОВОЇ СТОМАТОЛОГІЇ ТА ІМПЛАНТАЦІЇ';
  static const _hours = 'Пн-Сб 8:00 - 20:00';
  static const _phone = '+38050 000 00 00';
  static const _dropdownLabels = {'Послуги', 'Для пацієнтів'};

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Container(
          decoration: const BoxDecoration(
            color: AppColors.paper,
            border: Border(
              bottom: BorderSide(
                color: AppColors.line,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: isDesktop ? 0 : AppSpacing.md,
          ),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              _Logo(logoText: logoText, tagline: _tagline),
              const SizedBox(width: AppSpacing.lg),
              Text(
                'Обрати інше місто:',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.muted),
              ),
              const SizedBox(width: AppSpacing.sm),
              _CityDropdown(
                selectedCity: selectedCity,
                cities: cities,
                onCityChanged: onCityChanged,
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: AppColors.muted,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                _hours,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.inkSoft),
              ),
              const SizedBox(width: AppSpacing.lg),
              const Icon(Icons.phone_outlined, size: 16, color: AppColors.muted),
              const SizedBox(width: AppSpacing.xs),
              Text(
                _phone,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.inkSoft,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.line),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              if (navItems != null)
                Row(
                  children: [
                    for (final item in navItems!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                        ),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(item.label),
                              if (_dropdownLabels.contains(item.label)) ...[
                                const SizedBox(width: AppSpacing.xs),
                                const Icon(Icons.expand_more, size: 18),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              const Spacer(),
              const _LanguageSelector(),
              const SizedBox(width: AppSpacing.lg),
              ElevatedButton(
                onPressed: onConsultationTap,
                child: Text(consultationLabel),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Logo(logoText: logoText, tagline: _tagline, compact: true),
        ),
        const SizedBox(width: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          constraints: const BoxConstraints(maxWidth: 96),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.line),
            borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
          ),
          child: Text(
            selectedCity,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.ink,
                ),
          ),
        ),
        if (onMenuTap != null)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuTap,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}

class _Logo extends StatelessWidget {
  const _Logo({
    required this.logoText,
    required this.tagline,
    this.compact = false,
  });

  final String logoText;
  final String tagline;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: const Size(28, 28),
          painter: _LogoMarkPainter(),
        ),
        const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                logoText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:
                    (compact
                            ? Theme.of(context).textTheme.titleLarge
                            : Theme.of(context).textTheme.headlineSmall)
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.navy,
                          height: 1,
                        ),
              ),
              if (!compact) ...[
                const SizedBox(height: 2),
                Text(
                  tagline,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 0.6,
                    fontSize: 9,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _LogoMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final petal = Paint()..color = AppColors.teal;
    final petalDark = Paint()..color = AppColors.tealDark;
    for (var i = 0; i < 4; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * math.pi / 2);
      final path = Path()
        ..moveTo(0, 0)
        ..quadraticBezierTo(
          size.width * 0.32,
          -size.height * 0.18,
          0,
          -size.height * 0.5,
        )
        ..quadraticBezierTo(
          -size.width * 0.32,
          -size.height * 0.18,
          0,
          0,
        )
        ..close();
      canvas.drawPath(path, i.isEven ? petal : petalDark);
      canvas.restore();
    }
    canvas.drawCircle(center, size.width * 0.09, Paint()..color = AppColors.navy);
  }

  @override
  bool shouldRepaint(covariant _LogoMarkPainter oldDelegate) => false;
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'UA',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(Icons.expand_more, size: 16, color: AppColors.muted),
        ],
      ),
    );
  }
}

class _CityDropdown extends StatelessWidget {
  const _CityDropdown({
    required this.selectedCity,
    required this.cities,
    required this.onCityChanged,
  });

  final String selectedCity;
  final List<String> cities;
  final ValueChanged<String> onCityChanged;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: selectedCity,
      onSelected: onCityChanged,
      itemBuilder: (context) {
        return cities.map((city) {
          return PopupMenuItem<String>(
            value: city,
            child: Text(city),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line),
          borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedCity,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.expand_more, size: 20),
          ],
        ),
      ),
    );
  }
}
