import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/patient_story_card.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';

const _caseMeta = 'All-on-6 · 2 візити · Постійний протез · #єрішення';
const _caseName = 'Марія, 54 роки · Відень, Австрія';
const _caseQuote = 'Я 8 років не фотографувалась у повну посмішку. Ховала '
    'рот на фото, уникала сміятись на людях. За два візити повернула те, '
    'що вважала назавжди втраченим.';

const _reviewAuthor = 'Оксана М.';
const _reviewDate = '21.07.2026';
const _reviewText = 'Нарешті знайшла клініку, де пояснюють що роблять і '
    'чому. Ніякого тиску, ніяких несподіваних цін. Імплант поставили — і '
    'я забула, що він взагалі є.';

const _caseKindsDesktop = [
  'video',
  'beforeAfter',
  'beforeAfter',
  'beforeAfter',
  'video',
  'beforeAfter',
];

class CasesScreen extends StatelessWidget {
  const CasesScreen({super.key});

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
          (label: 'Для пацієнтів', onTap: () {}),
          (label: 'Контакти', onTap: () => context.go(AppRoutes.contacts)),
        ],
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Breadcrumb(),
                  const SizedBox(height: AppSpacing.lg),
                  const _HeroHeading(),
                  const SizedBox(height: AppSpacing.xl),
                  FilterChipsRow(
                    options: const [
                      'Всі',
                      'Імплантація',
                      'Ортодонтія',
                      'Вибілювання зубів',
                      'Вініри',
                    ],
                    selected: 'Всі',
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _CasesGrid(),
                  const SizedBox(height: AppSpacing.xl),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.line),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                          vertical: AppSpacing.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.buttonRadius,
                          ),
                        ),
                      ),
                      child: const Text('ПОДИВИТИСЬ ВСІ ІСТОРІЇ'),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  const _ReviewsSection(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.navy,
              child: LeadFormSection(
                title: 'Знайдемо рішення\nдля вашої ситуації теж',
                subtitle: 'Запишіться на консультацію або напишіть нам. '
                    'Розберемось у ситуації, пояснимо варіанти, '
                    'зафіксуємо вартість.',
                services: const ['Дитяча стоматологія'],
                submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                onSubmit: (name, phone, service, date) {},
                trailing: const _ImagePlaceholder(
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 200,
              cities: const ['Івано-Франківськ', 'Чернівці'],
              linkColumns: {
                'Послуги': [
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
                'Пацієнтам': [
                  (label: 'Про нас', onTap: () => context.go(AppRoutes.about)),
                  (label: 'Ціни', onTap: () => context.go(AppRoutes.prices)),
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
              socialLinks: [
                (icon: Icons.send, onTap: () {}),
                (icon: Icons.camera_alt, onTap: () {}),
                (icon: Icons.chat, onTap: () {}),
                (icon: Icons.chat_bubble, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb();

  @override
  Widget build(BuildContext context) {
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
          'Історії пацієнтів',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _HeroHeading extends StatelessWidget {
  const _HeroHeading();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;
        final title = Text(
          'Історії наших пацієнтів',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
        );
        final subtitle = Text(
          'Реальні історії лікування наших пацієнтів у фото та відео. '
          'Переконайтеся, як змінюються усмішки завдяки сучасним методам '
          'стоматології та індивідуальному підходу.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.inkSoft,
              ),
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: title),
              const SizedBox(width: AppSpacing.xl),
              Expanded(child: subtitle),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(height: AppSpacing.md),
            subtitle,
          ],
        );
      },
    );
  }
}

class _CasesGrid extends StatelessWidget {
  const _CasesGrid();

  Widget _cardForKind(String kind) {
    if (kind == 'video') {
      return PatientStoryCard(
        imagePath: '',
        name: _caseName,
        metaLine: _caseMeta,
        quote: _caseQuote,
        detailsLabel: 'Детальніше',
        onDetailsTap: () {},
        onPlayTap: () {},
      );
    }
    return const _BeforeAfterCard();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        if (!isWide) {
          return Column(
            children: [
              for (var i = 0; i < 3; i++) ...[
                if (i > 0) const SizedBox(height: AppSpacing.lg),
                _cardForKind('video'),
              ],
            ],
          );
        }

        return Column(
          children: [
            for (var i = 0; i < _caseKindsDesktop.length; i += 2) ...[
              if (i > 0) const SizedBox(height: AppSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _cardForKind(_caseKindsDesktop[i])),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(child: _cardForKind(_caseKindsDesktop[i + 1])),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

class _BeforeAfterCard extends StatelessWidget {
  const _BeforeAfterCard();

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
          const Row(
            children: [
              Expanded(
                child: _ImagePlaceholder(
                  height: 220,
                  label: 'До',
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: _ImagePlaceholder(
                  height: 220,
                  label: 'Після',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _caseMeta,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.muted,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _caseName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  _caseQuote,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.md),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Детальніше',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
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
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({
    this.width,
    this.height,
    this.label,
  });

  final double? width;
  final double? height;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          color: AppColors.cardBg,
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported,
            color: AppColors.muted,
            size: 32,
          ),
        ),
        if (label != null)
          Positioned(
            top: AppSpacing.sm,
            left: AppSpacing.sm,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.paper.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              ),
              child: Text(
                label!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'ВІДГУКИ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final heading = Text(
              'Що кажуть пацієнти',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.navy,
                  ),
            );
            final ratingRow = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '4.9',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star_rounded,
                      color: AppColors.teal,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(color: AppColors.line, width: 1),
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  'Google Maps · 200+ відгуків',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
              ],
            );

            if (isWide) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  heading,
                  ratingRow,
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading,
                const SizedBox(height: AppSpacing.md),
                ratingRow,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.xl),
        ArrowCarousel<int>(
          items: const [0, 1, 2, 3],
          itemWidth: 320,
          showDots: false,
          itemBuilder: (context, _) => const ReviewCard(
            authorName: _reviewAuthor,
            date: _reviewDate,
            rating: 4,
            text: _reviewText,
          ),
        ),
      ],
    );
  }
}
