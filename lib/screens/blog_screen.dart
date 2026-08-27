import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  static const _filters = [
    'Всі',
    'Імплантація',
    'Ортодонтія',
    'Вибілювання зубів',
    'Вініри',
  ];

  static const _postTag = 'Імплантація';
  static const _postDate = '21.07.2026';
  static const _postTitle = 'Імплантація зубів: повний гід';
  static const _postExcerpt =
      'Імплантація при нестачі кістки: що робити, якщо «кістки не вистачає» '
      'Ще декілька років тому стоматологічні пацієнти, що мали бажання '
      'відновити...';
  static const _postDetailsLabel = 'Детальніше';

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
          (label: 'Ціни', onTap: () => context.go(AppRoutes.prices)),
          (
            label: 'Стоматологічний туризм',
            onTap: () => context.go(AppRoutes.tourism),
          ),
          (label: 'Для пацієнтів', onTap: _noop),
          (label: 'Контакти', onTap: () => context.go(AppRoutes.contacts)),
        ],
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBreadcrumbs(context),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Блог',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.navy,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  FilterChipsRow(
                    options: _filters,
                    selected: 'Всі',
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _BlogPostGrid(),
                  const SizedBox(height: AppSpacing.xl),
                  const _PageIndicator(
                    currentPage: 1,
                    totalPages: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: LeadFormSection(
                title: 'Знайдемо рішення\nдля вашої ситуації теж',
                subtitle: 'Запишіться на консультацію або напишіть нам. '
                    'Розберемось у ситуації, пояснимо варіанти, зафіксуємо '
                    'вартість.',
                services: const ['Дитяча стоматологія'],
                submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                onSubmit: (name, phone, service, date) {},
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
                  (label: 'Ортодонтія', onTap: _noop),
                  (label: 'Вибілювання зубів', onTap: _noop),
                  (label: 'Профілактична стоматологія', onTap: _noop),
                  (label: 'Вініри естетичне протезування', onTap: _noop),
                  (label: 'Протезування', onTap: _noop),
                  (label: 'Видалення зубів', onTap: _noop),
                  (label: 'Лікування уві сні', onTap: _noop),
                  (label: 'Дитяча стоматологія', onTap: _noop),
                  (label: 'Лікування зубних каналів', onTap: _noop),
                  (label: 'Хірургічна стоматологія', onTap: _noop),
                  (label: 'Професійна гігієна', onTap: _noop),
                ],
                'ПАЦІЄНТАМ': [
                  (label: 'Про нас', onTap: () => context.go(AppRoutes.about)),
                  (label: 'Ціни', onTap: () => context.go(AppRoutes.prices)),
                  (
                    label: 'Стоматологічний туризм',
                    onTap: () => context.go(AppRoutes.tourism),
                  ),
                  (label: 'Новини', onTap: _noop),
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
              phone: 'Запис за телефоном\n+38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: const [
                (icon: Icons.telegram, onTap: _noop),
                (icon: Icons.camera_alt, onTap: _noop),
                (icon: Icons.chat_bubble, onTap: _noop),
                (icon: Icons.chat_bubble, onTap: _noop),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumbs(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => context.go(AppRoutes.home),
          child: Text(
            'Головна',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.muted,
                ),
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '/',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.muted,
              ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          'Блог',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
              ),
        ),
      ],
    );
  }
}

void _noop([Object? a, Object? b, Object? c, Object? d]) {}

class _BlogPostGrid extends StatelessWidget {
  const _BlogPostGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 600
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.lg,
            mainAxisSpacing: AppSpacing.lg,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            return const _BlogPostCard(
              imagePath: '',
              tag: BlogScreen._postTag,
              date: BlogScreen._postDate,
              title: BlogScreen._postTitle,
              excerpt: BlogScreen._postExcerpt,
              detailsLabel: BlogScreen._postDetailsLabel,
            );
          },
        );
      },
    );
  }
}

class _BlogPostCard extends StatelessWidget {
  const _BlogPostCard({
    required this.imagePath,
    required this.tag,
    required this.date,
    required this.title,
    required this.excerpt,
    required this.detailsLabel,
  });

  final String imagePath;
  final String tag;
  final String date;
  final String title;
  final String excerpt;
  final String detailsLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                : Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tealSoft,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.chipRadius,
                        ),
                      ),
                      child: Text(
                        tag,
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColors.tealDark,
                                ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  excerpt,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkSoft,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      detailsLabel,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.ink,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: AppColors.ink,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ArrowButton(icon: Icons.chevron_left, onTap: () {}),
        const SizedBox(width: AppSpacing.lg),
        Text(
          '$currentPage/$totalPages',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
              ),
        ),
        const SizedBox(width: AppSpacing.lg),
        _ArrowButton(icon: Icons.chevron_right, onTap: () {}),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.line),
          ),
        ),
        child: Icon(icon, color: AppColors.ink, size: 20),
      ),
    );
  }
}
