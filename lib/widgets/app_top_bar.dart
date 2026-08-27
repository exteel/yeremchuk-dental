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
          padding: const EdgeInsets.all(AppSpacing.md),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Text(
          logoText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
        ),
        const SizedBox(width: AppSpacing.lg),
        _CityDropdown(
          selectedCity: selectedCity,
          cities: cities,
          onCityChanged: onCityChanged,
        ),
        const Spacer(),
        if (navItems != null)
          Row(
            children: [
              for (final item in navItems!)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm),
                  child: TextButton(
                    onPressed: item.onTap,
                    child: Text(item.label),
                  ),
                ),
            ],
          ),
        const SizedBox(width: AppSpacing.lg),
        ElevatedButton(
          onPressed: onConsultationTap,
          child: Text(consultationLabel),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            logoText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.navy,
                ),
          ),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
