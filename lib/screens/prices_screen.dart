import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});

  static const _categories = [
    'Консультація',
    'Імплантація',
    'Протезування',
    'Хірургічне лікування',
    'Лікування зубів',
    'Видалення зубів',
    'Лікування ясен та каналів',
    'Професійна гігієна/Вибілювання',
    'Ортодонтія',
    'Дитяча стоматологія',
  ];

  static const _implantRows = [
    _PriceRow(label: 'Імплантація одного зуба', price: 'від 21 600 грн'),
    _PriceRow(label: 'Одноетапна імплантація', price: 'від 21 600 грн'),
    _PriceRow(label: 'Повна імплантація', price: 'від 21 600 грн'),
    _PriceRow(
      label: 'Імплантація зубів All-on-4/6',
      price: 'від 21 600 грн',
    ),
    _PriceRow(
      label: 'Одноетапна (експрес) імплантація зубів',
      price: 'від 21 600 грн',
    ),
    _PriceRow(label: 'Лазерна імплантація зубів', price: 'від 21 600 грн'),
  ];

  static const _priceCategories = [
    _PriceCategory(
      title: 'Консультація',
      ctaLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
      rows: [
        _PriceRow(label: 'Експрес-консультація', price: '400 грн'),
        _PriceRow(
          label: 'Розширена консультація (зі складанням плану лікування)',
          price: '600 грн',
        ),
        _PriceRow(
          label: 'On-line консультація',
          price: '600 грн',
          oldPrice: '600 грн',
          badge: 'АКЦІЯ',
        ),
        _PriceRow(label: 'Консультація головного лікаря', price: '1000 грн'),
      ],
    ),
    _PriceCategory(
      title: 'Імплантація',
      ctaLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
      rows: _implantRows,
    ),
    _PriceCategory(
      title: 'Протезування',
      ctaLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
      rows: _implantRows,
    ),
    _PriceCategory(
      title: 'Хірургічне лікування',
      ctaLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
      rows: _implantRows,
    ),
    _PriceCategory(
      title: 'Лікування зубів',
      ctaLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
      rows: _implantRows,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        logoText: 'YEREMCHUK DENTAL',
        cities: const ['Івано-Франківськ', 'Чернівці'],
        selectedCity: 'Івано-Франківськ',
        onCityChanged: (_) {},
        onConsultationTap: () {},
        consultationLabel: 'Онлайн консультація',
        navItems: [
          (label: 'Послуги', onTap: () => context.go(AppRoutes.category)),
          (label: 'Про нас', onTap: () => context.go(AppRoutes.about)),
          (label: 'Ціни', onTap: () {}),
          (
            label: 'Стоматологічний туризм',
            onTap: () => context.go(AppRoutes.tourism),
          ),
          (label: 'Для пацієнтів', onTap: () {}),
          (label: 'Контакти', onTap: () => context.go(AppRoutes.contacts)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Text(
                    'Головна',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.muted,
                        ),
                  ),
                  Text(
                    ' / ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.muted,
                        ),
                  ),
                  Text(
                    'Ціни',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.ink,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                AppSpacing.md,
                AppSpacing.xl,
                AppSpacing.xl,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 900;

                  final heading = Text(
                    'Ціни на стоматологічні послуги',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColors.navy,
                          fontWeight: FontWeight.bold,
                        ),
                  );

                  final badges = Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: const [
                      _InfoBadge(
                        text:
                            'Є розтермінування — до 6 місяців від ПриватБанку без переплат',
                      ),
                      _InfoBadge(
                        text: 'Ціна фіксується до початку лікування',
                      ),
                    ],
                  );

                  final headerSection = isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: heading),
                            const SizedBox(width: AppSpacing.lg),
                            badges,
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heading,
                            const SizedBox(height: AppSpacing.md),
                            badges,
                          ],
                        );

                  final sidebar = const _CategorySidebar(
                    categories: _categories,
                  );

                  final cardsColumn = Column(
                    children: [
                      for (final category in _priceCategories) ...[
                        _PriceCard(category: category),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                    ],
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerSection,
                      const SizedBox(height: AppSpacing.xl),
                      isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 260, child: sidebar),
                                const SizedBox(width: AppSpacing.lg),
                                Expanded(child: cardsColumn),
                              ],
                            )
                          : Column(
                              children: [
                                sidebar,
                                const SizedBox(height: AppSpacing.lg),
                                cardsColumn,
                              ],
                            ),
                    ],
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.navy,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#ЄРІШЕННЯ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.teal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LeadFormSection(
                    title: 'Знайдемо рішення\nдля вашої ситуації теж',
                    subtitle:
                        'Запишіться на консультацію або напишіть нам. Розберемось у ситуації, пояснимо варіанти, зафіксуємо вартість.',
                    services: _categories,
                    submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                    onSubmit: (name, phone, service, date) {},
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.cardRadius,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 320,
                        color: AppColors.navySoft,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white54,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 0,
              cities: const ['Івано-Франківськ', 'Чернівці'],
              linkColumns: {
                'ПОСЛУГИ': [
                  (
                    label: 'Імплантація',
                    onTap: () => context.go(AppRoutes.category),
                  ),
                  (label: 'Ортодонтія', onTap: () {}),
                  (label: 'Вибілювання зубів', onTap: () {}),
                  (label: 'Профілактична стоматологія', onTap: () {}),
                  (label: 'Вініри естетичне протезування', onTap: () {}),
                  (label: 'Протезування', onTap: () {}),
                  (label: 'Видалення зубів', onTap: () {}),
                  (label: 'Лікування уві сні', onTap: () {}),
                  (label: 'Дитяча стоматологія', onTap: () {}),
                  (label: 'Лікування зубних каналів', onTap: () {}),
                  (label: 'Хірургічна стоматологія', onTap: () {}),
                  (label: 'Професійна гігієна', onTap: () {}),
                ],
                'ПАЦІЄНТАМ': [
                  (label: 'Про нас', onTap: () => context.go(AppRoutes.about)),
                  (label: 'Ціни', onTap: () {}),
                  (
                    label: 'Стоматологічний туризм',
                    onTap: () => context.go(AppRoutes.tourism),
                  ),
                  (label: 'Новини', onTap: () {}),
                  (
                    label: 'Питання та відповіді',
                    onTap: () => context.go(AppRoutes.doctorFaq),
                  ),
                  (
                    label: 'Контакти',
                    onTap: () => context.go(AppRoutes.contacts),
                  ),
                ],
              },
              phone: '+38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: const [
                (icon: Icons.send, onTap: _noop),
                (icon: Icons.camera_alt, onTap: _noop),
                (icon: Icons.chat_bubble, onTap: _noop),
                (icon: Icons.forum, onTap: _noop),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void _noop() {}
}

class _InfoBadge extends StatelessWidget {
  const _InfoBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.teal, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.ink,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySidebar extends StatelessWidget {
  const _CategorySidebar({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        children: [
          for (var i = 0; i < categories.length; i++)
            _CategoryItem(
              label: categories[i],
              isSelected: i == 0,
              onTap: () {},
            ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.sm),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs / 2),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.paperDim : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? AppColors.ink : AppColors.inkSoft,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}

class _PriceRow {
  const _PriceRow({
    required this.label,
    required this.price,
    this.oldPrice,
    this.badge,
  });

  final String label;
  final String price;
  final String? oldPrice;
  final String? badge;
}

class _PriceCategory {
  const _PriceCategory({
    required this.title,
    required this.ctaLabel,
    required this.rows,
  });

  final String title;
  final String ctaLabel;
  final List<_PriceRow> rows;
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({required this.category});

  final _PriceCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(
                    angle: 0.785398,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.tealSoft,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    category.title,
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.navy,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.navy),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppSpacing.buttonRadius),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                ),
                child: Text(
                  category.ctaLabel,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.navy,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          for (var i = 0; i < category.rows.length; i++) ...[
            _PriceRowTile(row: category.rows[i]),
            if (i < category.rows.length - 1)
              const Divider(color: AppColors.line, height: AppSpacing.xl),
          ],
        ],
      ),
    );
  }
}

class _PriceRowTile extends StatelessWidget {
  const _PriceRowTile({required this.row});

  final _PriceRow row;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            row.label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.ink,
                ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        if (row.badge != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs / 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.tealSoft,
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
            ),
            child: Text(
              row.badge!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.tealDark,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
        if (row.oldPrice != null) ...[
          Text(
            row.oldPrice!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.muted,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(
          row.price,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
