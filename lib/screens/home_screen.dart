import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/doctor_card.dart';
import 'package:yeremchuk_dental/widgets/faq_accordion.dart';
import 'package:yeremchuk_dental/widgets/feature_card.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/numbered_step_card.dart';
import 'package:yeremchuk_dental/widgets/patient_story_card.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';

void _noop() {}

void _noopString(String _) {}

const _cities = ['Чернівці', 'Івано-Франківськ', 'Тернопіль', 'Київ'];

const _serviceLinks = [
  'Імплантація',
  'Ортодонтія',
  'Вибілювання зубів',
  'Профілактична стоматологія',
  'Вініри естетичне протезування',
  'Протезування',
  'Видалення зубів',
  'Лікування уві сні',
  'Дитяча стоматологія',
  'Лікування зубних каналів',
  'Хірургічна стоматологія',
  'Професійна гігієна',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        logoText: 'YEREMCHUK DENTAL',
        cities: _cities,
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
            const _HeroSection(),
            const _PatientProblemsSection(),
            const _CasesSection(),
            const _HowWeWorkSection(),
            const _NextStepSection(),
            const _AdvantagesSection(),
            const _ServicesSection(),
            const _TourismBanner(),
            const _DoctorsSection(),
            const _VideoFaqSection(),
            const _ReviewsSection(),
            const _FaqSection(),
            const _LeadFormWrapper(),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 200,
              cities: const ['Івано-Франківськ', 'Чернівці'],
              linkColumns: {
                'ПОСЛУГИ': [
                  for (final label in _serviceLinks)
                    (
                      label: label,
                      onTap: label == 'Імплантація'
                          ? () => context.go(AppRoutes.category)
                          : _noop,
                    ),
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
              phone: 'Запис за телефоном +38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: const [
                (icon: Icons.telegram, onTap: _noop),
                (icon: Icons.camera_alt, onTap: _noop),
                (icon: Icons.chat, onTap: _noop),
                (icon: Icons.chat_bubble, onTap: _noop),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({
    required this.child,
    this.dim = false,
  });

  final Widget child;
  final bool dim;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: dim ? AppColors.paperDim : AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    this.eyebrow,
    this.subtitle,
  });

  final String title;
  final String? eyebrow;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eyebrow != null) ...[
            Text(
              eyebrow!,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.inkSoft,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage({this.aspectRatio = 4 / 3});

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        color: AppColors.cardBg,
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_outlined,
          color: AppColors.muted,
          size: 40,
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 900;

          final textColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    const Icon(Icons.star, color: AppColors.amber, size: 18),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '4.9 Google',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      child: Text(
                        '· Івано-Франківськ · Чернівці',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(color: AppColors.muted),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Мережа стоматологічних клінік Yeremchuk Dental – є рішення '
                'на кожен зуб',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Мережа клінік стоматології та імплантації – від турботи '
                'про перший молочний зубчик до повного відновлення '
                'посмішки.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.inkSoft,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: () {},
                child: const Text('ЗАПИСАТИСЬ НА ПРИЙОМ'),
              ),
            ],
          );

          final imageColumn = Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                child: _PlaceholderImage(
                  aspectRatio: isDesktop ? 16 / 11 : 4 / 3,
                ),
              ),
              Positioned(
                top: AppSpacing.md,
                left: AppSpacing.md,
                child: _CheckBadge(
                  text: 'Фіксуємо вартість\nлікування до його початку',
                ),
              ),
              Positioned(
                bottom: AppSpacing.xxl,
                right: AppSpacing.md,
                child: _CheckBadge(
                  text: 'Складний випадок?\nУ нас є рішення',
                ),
              ),
              Positioned(
                bottom: -AppSpacing.lg,
                left: AppSpacing.lg,
                child: _CheckBadge(
                  text: 'Консультація без тиску:\nрішення за Вами',
                ),
              ),
            ],
          );

          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: imageColumn),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textColumn,
              const SizedBox(height: AppSpacing.xxl),
              imageColumn,
              const SizedBox(height: AppSpacing.lg),
            ],
          );
        },
      ),
    );
  }
}

class _CheckBadge extends StatelessWidget {
  const _CheckBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 220),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, color: AppColors.teal, size: 16),
          const SizedBox(width: AppSpacing.xs),
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.isHighlighted = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(
          color: isHighlighted ? AppColors.teal : AppColors.line,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                  ),
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        description,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(width: AppSpacing.sm),
            InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHighlighted ? AppColors.teal : Colors.transparent,
                  border: isHighlighted
                      ? null
                      : const Border.fromBorderSide(
                          BorderSide(color: AppColors.line),
                        ),
                ),
                child: Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: isHighlighted ? Colors.white : AppColors.muted,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PatientProblemsSection extends StatelessWidget {
  const _PatientProblemsSection();

  static const List<({IconData icon, String title})> _problems = [
    (
      icon: Icons.medical_services_outlined,
      title: 'Болить зуб — і страшно йти до лікаря',
    ),
    (
      icon: Icons.medical_services_outlined,
      title: 'Сказали, що зуб на видалення',
    ),
    (
      icon: Icons.medical_services_outlined,
      title: 'Немає одного чи декількох зубів',
    ),
    (
      icon: Icons.medical_services_outlined,
      title: 'Роками уникаю стоматолога через страх',
    ),
    (
      icon: Icons.medical_services_outlined,
      title: 'Дитина боїться лікувати зуби',
    ),
    (
      icon: Icons.chat_bubble_outline,
      title: 'Потрібна альтернативна думка нашого спеціаліста?',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: '#ЄРІШЕННЯ',
            title: 'З чим до нас приходять пацієнти?',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final list = Column(
                children: [
                  for (var i = 0; i < _problems.length; i++) ...[
                    _InfoCard(
                      icon: _problems[i].icon,
                      title: _problems[i].title,
                      description: 'Вилікуємо без болю та стресу',
                      isHighlighted: i == 0,
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                ],
              );

              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.cardRadius,
                        ),
                        child: const _PlaceholderImage(aspectRatio: 4 / 5),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(child: list),
                  ],
                );
              }

              return list;
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'МАЄТЕ ІНШУ СИТУАЦІЮ? НАДІШЛІТЬ НАМ ПОВІДОМЛЕННЯ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    const Icon(Icons.arrow_forward, color: AppColors.teal),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CasesSection extends StatelessWidget {
  const _CasesSection();

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      dim: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'КЕЙСИ',
            title: 'Історії, що надихають',
          ),
          ArrowCarousel<int>(
            items: const [0, 1],
            itemWidth: 320,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const PatientStoryCard(
                  imagePath: '',
                  name: 'Марія, 54 роки · Відень, Австрія',
                  metaLine:
                      'All-on-6 · 2 візити · Постійний протез · #єрішення',
                  quote:
                      'Я 8 років не фотографувалась у повну посмішку. '
                      'Ховала рот на фото, уникала сміятись на людях. За '
                      'два візити повернула те, що вважала назавжди '
                      'втраченим.',
                  detailsLabel: 'Детальніше',
                  onDetailsTap: _noop,
                  onPlayTap: _noop,
                );
              }
              return const _BeforeAfterStoryCard();
            },
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => context.go(AppRoutes.cases),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.ink,
              side: const BorderSide(color: AppColors.line),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              ),
            ),
            child: const Text('БІЛЬШЕ ІСТОРІЙ'),
          ),
          const SizedBox(height: AppSpacing.xl),
          const _ConsultationBanner(),
        ],
      ),
    );
  }
}

class _BeforeAfterStoryCard extends StatelessWidget {
  const _BeforeAfterStoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        color: AppColors.paper,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Expanded(child: _BeforeAfterTile(label: 'До')),
              Expanded(child: _BeforeAfterTile(label: 'Після')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All-on-6 · 2 візити · Постійний протез · #єрішення',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Марія, 54 роки · Відень, Австрія',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Я 8 років не фотографувалась у повну посмішку. Ховала '
                  'рот на фото, уникала сміятись на людях. За два візити '
                  'повернула те, що вважала назавжди втраченим.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BeforeAfterTile extends StatelessWidget {
  const _BeforeAfterTile({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: Container(
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
            ),
          ),
        ),
        Positioned(
          top: AppSpacing.sm,
          left: AppSpacing.sm,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

class _ConsultationBanner extends StatelessWidget {
  const _ConsultationBanner();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      // The banner copy is real client content and can run long on narrow
      // (mobile) viewports. Rather than pinning the background image to a
      // fixed aspect ratio and force-fitting the text into whatever height
      // that leaves (which overflows badly on mobile), the background and
      // gradient are `Positioned.fill` so they stretch to match the height
      // the text content actually needs — the un-positioned Padding/Column
      // below is what drives the Stack's size.
      child: Stack(
        children: [
          const Positioned.fill(child: _PlaceholderImage()),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.navy.withValues(alpha: 0.85),
                    AppColors.navy.withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Консультація без тиску. Рішення за Вами',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Не впевнені щодо запланованого стоматологічного '
                  'лікування?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Просто розкажіть нам свою ситуацію, або завантажте КТ. '
                  'Підберемо варіанти лікування та сформуємо чесний '
                  'кошторис. Без поспіху, без тиску.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      onPressed: () {},
                      child: const Text('ЗАВАНТАЖИТИ КТ'),
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

class _HowWeWorkSection extends StatelessWidget {
  const _HowWeWorkSection();

  static const List<({String description, String title})> _steps = [
    (
      title: 'Розкажіть, що саме Вас турбує',
      description: 'Лікар уважно вислухає та проведе необхідну діагностику',
    ),
    (
      title: 'Надаємо чіткі роз’яснення',
      description:
          'Щодо майбутнього стоматологічного лікування та його вартості. '
          'Запропонуємо альтернативні варіанти.',
    ),
    (
      title: 'Затвердіть план Вашого лікування',
      description:
          'Усе фіксуємо у письмовій формі ще до проведення першої '
          'процедури',
    ),
    (
      title: 'Супровід лікаря після відновлення посмішки',
      description:
          'Ми залишаємось на зв’язку після завершення стоматологічного '
          'лікування.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'ЯК МИ ПРАЦЮЄМО',
            title: 'Як ми працюємо: від першого дзвінка до результату',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final photo = ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                child: const _PlaceholderImage(aspectRatio: 16 / 9),
              );

              if (isDesktop) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < 2; i++) ...[
                          Expanded(
                            child: NumberedStepCard(
                              stepNumber: i + 1,
                              title: _steps[i].title,
                              description: _steps[i].description,
                            ),
                          ),
                          if (i == 0) const SizedBox(width: AppSpacing.md),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 2; i < 4; i++) ...[
                          Expanded(
                            child: NumberedStepCard(
                              stepNumber: i + 1,
                              title: _steps[i].title,
                              description: _steps[i].description,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                        ],
                        Expanded(child: photo),
                      ],
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < _steps.length; i++) ...[
                    NumberedStepCard(
                      stepNumber: i + 1,
                      title: _steps[i].title,
                      description: _steps[i].description,
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                  photo,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NextStepSection extends StatelessWidget {
  const _NextStepSection();

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      dim: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            title: 'Оберіть свій наступний крок з Yeremchuk Dental',
          ),
          const FilterChipsRow(
            options: [
              'Калькулятор імплантації',
              'Альтернативна думка',
              'Онлайн консультація',
            ],
            selected: 'Калькулятор імплантації',
            onSelected: _noopString,
          ),
          const SizedBox(height: AppSpacing.lg),
          const _CalculatorCard(),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 3; i++)
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                  ),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == 0 ? AppColors.teal : AppColors.line,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalculatorCard extends StatelessWidget {
  const _CalculatorCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 900;
          final photo = ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            child: const _PlaceholderImage(aspectRatio: 4 / 3),
          );
          final textColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
                child: const Icon(Icons.calculate, color: Colors.white),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Хочете знати вартість лікування ще до консультації?',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Розрахуйте усе самостійно за 2 хвилини – без дзвінків '
                'та жодних зобов’язань',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('РОЗРАХУВАТИ'),
                ),
              ),
            ],
          );

          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: photo),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: textColumn),
              ],
            );
          }

          return Column(children: [photo, textColumn]);
        },
      ),
    );
  }
}

class _AdvantagesSection extends StatelessWidget {
  const _AdvantagesSection();

  static const List<({String description, IconData icon, String title})>
  _benefits = [
    (
      icon: Icons.forum_outlined,
      title: 'Пояснюємо усі деталі. Зайвого не нав’язуємо',
      description:
          'Детально роз’яснюємо усі деталі майбутнього лікування. '
          'Можливі переваги і недоліки. Наводимо аргументи із '
          'практичного досвіду. Жодного тиску. Рішення завжди за Вами',
    ),
    (
      icon: Icons.attach_money,
      title: 'Вартість фіксуємо першочергово',
      description:
          'Жодних сюрпризів у фіналі лікування. Усі процедури '
          'відповідно до погодженого плану. За потреби – є можливість '
          'розтермінування оплати від ПриватБанк на 6 місяців.',
    ),
    (
      icon: Icons.public,
      title: 'Пацієнти у будь-якій точці світу',
      description:
          'Онлайн консультація наших спеціалістів перед поїздкою в '
          'Україну. Організовуємо лікування та перебування. Пацієнти '
          'з Австрії, Польщі, Ізраїлю та інших країн.',
    ),
    (
      icon: Icons.groups_outlined,
      title: 'Професійна команда для складних викликів',
      description:
          'Складні випадки розглядаємо колегіально. Вирішуємо '
          'проблему комплексно якщо одному спеціалісту це не під силу. '
          'Хірург, ортопед, ендодонтист, анестезіолог – єдина команда.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      dim: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'ПЕРЕВАГИ',
            title: 'Чому обирають Yeremchuk Dental',
          ),
          const _StatsRow(
            stats: [
              (value: '3200+', label: 'імплантацій з 2010'),
              (value: '12', label: 'країн звідки їдуть пацієнти'),
              (value: '4.9', label: 'рейтинг Google'),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(color: AppColors.line, height: 1),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final cards = [
                for (final benefit in _benefits)
                  FeatureCard(
                    icon: benefit.icon,
                    title: benefit.title,
                    description: benefit.description,
                  ),
              ];

              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      Expanded(child: cards[i]),
                      if (i < cards.length - 1)
                        const SizedBox(width: AppSpacing.md),
                    ],
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    cards[i],
                    if (i < cards.length - 1)
                      const SizedBox(height: AppSpacing.md),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.stats});

  final List<({String value, String label})> stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < stats.length; i++) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  stats[i].value,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  stats[i].label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          if (i < stats.length - 1)
            const SizedBox(
              height: 48,
              child: VerticalDivider(color: AppColors.line, width: 32),
            ),
        ],
      ],
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  static const List<
    ({String description, String heading, bool isUrgent, String label})
  >
  _services = [
    (
      label: 'ІМПЛАНТАЦІЯ',
      heading:
          'Втратили зуб?\nПоставимо імплант — і ви забудете, що його не '
          'було',
      description:
          'Виглядає і жується як власний зуб. Без знімних протезів, '
          'без обточування сусідніх. Одне рішення на все життя.',
      isUrgent: false,
    ),
    (
      label: 'ALL-ON-4 / ALL-ON-6',
      heading:
          'Майже немає зубів? Повноцінна посмішка за 1–2 візити. '
          'Назавжди.',
      description:
          'Жодних сюрпризів у фіналі. А якщо не готові зараз — '
          'розтермінування до 6 місяців від ПриватБанку без переплат.',
      isUrgent: false,
    ),
    (
      label: 'ЛІКУВАННЯ УВІ СНІ (СЕДАЦІЯ)',
      heading:
          'Боїтесь стоматолога? Просто заснете — і прокинетесь з '
          'результатом',
      description:
          'Онлайн-консультація до поїздки, допомога з організацією '
          'маршруту і житла. Пацієнти з Австрії, Польщі, Ізраїлю та '
          'інших країн',
      isUrgent: false,
    ),
    (
      label: 'ЛІКУВАННЯ ПІД МІКРОСКОПОМ',
      heading: 'Сказали "видаляти"? Зачекайте — ми подивимось ще раз',
      description:
          'Складні випадки розглядаємо колегіально — хірург, ортопед, '
          'ендодонтист, анестезіолог разом. Вирішують те, що одному '
          'лікарю не під силу',
      isUrgent: false,
    ),
    (
      label: 'ДИТЯЧА СТОМАТОЛОГІЯ',
      heading: 'Дитина боїться стоматолога? Ми знаємо, як це змінити',
      description:
          'Онлайн-консультація до поїздки, допомога з організацією '
          'маршруту і житла. Пацієнти з Австрії, Польщі, Ізраїлю та '
          'інших країн',
      isUrgent: false,
    ),
    (
      label: 'ГОСТРИЙ БІЛЬ — ТЕРМІНОВА ДОПОМОГА',
      heading: 'Болить зуб прямо зараз? Знайдемо час сьогодні',
      description:
          'Складні випадки розглядаємо колегіально — хірург, ортопед, '
          'ендодонтист, анестезіолог разом. Вирішують те, що одному '
          'лікарю не під силу',
      isUrgent: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'ПОСЛУГИ',
            title: '#єрішення — для кожної ситуації',
            subtitle: 'Є можливість розтермінування лікування до 6 місяців',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final cards = [
                for (final service in _services)
                  _ServiceCard(
                    label: service.label,
                    heading: service.heading,
                    description: service.description,
                    isUrgent: service.isUrgent,
                  ),
              ];

              if (isDesktop) {
                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    for (final card in cards)
                      SizedBox(
                        width: (constraints.maxWidth - AppSpacing.md) / 2,
                        child: card,
                      ),
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    cards[i],
                    if (i < cards.length - 1)
                      const SizedBox(height: AppSpacing.md),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: OutlinedButton(
              onPressed: () => context.go(AppRoutes.category),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.line),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSpacing.buttonRadius,
                  ),
                ),
              ),
              child: const Text('БІЛЬШЕ ПОСЛУГ'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.label,
    required this.heading,
    required this.description,
    required this.isUrgent,
  });

  final String label;
  final String heading;
  final String description;
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(
          color: isUrgent ? AppColors.danger : AppColors.line,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _PlaceholderImage(aspectRatio: 16 / 9),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Детальніше',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TourismBanner extends StatelessWidget {
  const _TourismBanner();

  static const List<String> _checklist = [
    'Онлайн-консультація до поїздки — знаєте план і вартість ще до того, '
        'як сісти в літак',
    'Допомагаємо з житлом і маршрутом — не займаєтесь організацією самі',
    'Плануємо лікування за мінімум поїздок — мінімум часу, максимум '
        'результату',
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      dim: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Stack(
          children: [
            const _PlaceholderImage(aspectRatio: 16 / 10),
            // Decorative dark-teal diamond accent peeking from the bottom-left
            // corner of the banner photo, per the reference design.
            Positioned(
              bottom: -40,
              left: -40,
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  width: 140,
                  height: 140,
                  color: AppColors.tealDark,
                ),
              ),
            ),
            Positioned(
              top: AppSpacing.lg,
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'СТОМАТОЛОГІЧНИЙ ТУРИЗМ',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium?.copyWith(
                        color: AppColors.muted,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Живете за кордоном?\nПриїжджаєте здалеку?',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        color: AppColors.navy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    for (final item in _checklist)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.sm,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.check_circle,
                                color: AppColors.teal,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text(
                                item,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.inkSoft),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: AppSpacing.sm),
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.tourism),
                      child: const Text('ДІЗНАТИСЬ БІЛЬШЕ'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorsSection extends StatelessWidget {
  const _DoctorsSection();

  static const List<
    ({bool isFeatured, String name, String position, String? quote})
  >
  _doctors = [
    (
      name: 'Володимир Олександрович Єремчук',
      position: 'Засновник клініки, хірург-імплантолог',
      quote: '«Складний випадок — це не вирок, це завдання»',
      isFeatured: true,
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Заступник головного лікаря, лікар-стоматолог',
      quote: null,
      isFeatured: false,
    ),
    (
      name: 'Любінець Марина Михайлівна',
      position: 'Дитячий стоматолог, загальний та терапевтичний прийом',
      quote: null,
      isFeatured: false,
    ),
    (
      name: 'Ірина Ростиславівна Янчинська',
      position: 'Лікар-стоматолог, пародонтолог',
      quote: null,
      isFeatured: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'СПЕЦІАЛІСТИ',
            title: 'Команда лікарів, якій довіряють',
            subtitle:
                'Над вирішенням Вашої стоматологічної проблеми '
                'працює команда досвідчених спеціалістів',
          ),
          ArrowCarousel<int>(
            items: List.generate(_doctors.length, (index) => index),
            itemWidth: 260,
            itemBuilder: (context, index) {
              final doctor = _doctors[index];
              return DoctorCard(
                imagePath: '',
                name: doctor.name,
                position: doctor.position,
                quote: doctor.quote,
                isFeatured: doctor.isFeatured,
                ctaLabel: 'Детальніше',
                onTap: () => context.go(AppRoutes.dentistProfile),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _VideoFaqCard extends StatelessWidget {
  const _VideoFaqCard({
    required this.name,
    required this.position,
    required this.question,
  });

  final String name;
  final String position;
  final String question;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              const _PlaceholderImage(aspectRatio: 1),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.navy,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            position,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.muted),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  question,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
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

class _VideoFaqSection extends StatelessWidget {
  const _VideoFaqSection();

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      dim: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'ВІДПОВІДІ НА ПОШИРЕНІ ПИТАННЯ',
            title: 'Питання та відповіді від наших лікарів',
          ),
          ArrowCarousel<int>(
            items: const [0, 1, 2],
            itemWidth: 300,
            itemBuilder: (context, index) {
              return const _VideoFaqCard(
                name: 'Наталія Іванівна Гранда',
                position: 'Лікар стоматолог',
                question: 'Чи боляче ставити імплант?',
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => context.go(AppRoutes.doctorFaq),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.ink,
              side: const BorderSide(color: AppColors.line),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              ),
            ),
            child: const Text('БІЛЬШЕ ВІДЕО'),
          ),
        ],
      ),
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'ВІДГУКИ',
            title: 'Що кажуть пацієнти',
          ),
          Row(
            children: [
              Text(
                '4.9',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Icon(Icons.star_rounded, color: AppColors.amber),
              const Icon(Icons.star_rounded, color: AppColors.amber),
              const Icon(Icons.star_rounded, color: AppColors.amber),
              const Icon(Icons.star_rounded, color: AppColors.amber),
              const Icon(Icons.star_rounded, color: AppColors.amber),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Google Maps · 200+ відгуків',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ArrowCarousel<int>(
            items: const [0, 1, 2, 3],
            itemWidth: 300,
            itemBuilder: (context, index) {
              return const ReviewCard(
                authorName: 'Оксана М.',
                date: '21.07.2026',
                rating: 4,
                text:
                    'Нарешті знайшла клініку, де пояснюють що роблять і '
                    'чому. Ніякого тиску, ніяких несподіваних цін. Імплант '
                    'поставили — і я забула, що він взагалі є.',
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  const _FaqSection();

  @override
  Widget build(BuildContext context) {
    return const _SectionContainer(
      dim: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(eyebrow: 'FAQ', title: 'Часті питання'),
          FaqAccordion(
            items: [
              FaqItem(
                question: 'Чи боляче лікувати зуби?',
                answer:
                    'Стоматологічна галузь у наш час пропонує різноманітні '
                    'методи знеболення. «Без болю» у сучасній стоматології '
                    '– небезпідставне формулювання, адже доступною є '
                    'метода лікування в седації. Це контрольований '
                    'медикаментозний сон, коли пацієнту пропонують '
                    'проведення усіх маніпуляцій уві сні під контролем '
                    'анестезіолога.',
              ),
              FaqItem(question: 'Скільки коштує консультація?', answer: ''),
              FaqItem(
                question: 'Чи можна лікувати зуби уві сні?',
                answer: '',
              ),
              FaqItem(
                question: 'Що робити, якщо я боюсь стоматолога?',
                answer: '',
              ),
              FaqItem(question: 'Як записатись на прийом?', answer: ''),
            ],
          ),
        ],
      ),
    );
  }
}

class _LeadFormWrapper extends StatelessWidget {
  const _LeadFormWrapper();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // AppColors.navySoft — the token pixel-sampled specifically from this
      // "Знайдемо рішення" CTA panel in the reference design.
      color: AppColors.navySoft,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#ЄРІШЕННЯ',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white70,
              letterSpacing: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          LeadFormSection(
            title: 'Знайдемо рішення для вашої ситуації теж',
            subtitle:
                'Запишіться на консультацію або напишіть нам. Розберемось '
                'у ситуації, пояснимо варіанти, зафіксуємо вартість.',
            services: const ['Дитяча стоматологія'],
            submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
            onSubmit: (name, phone, service, date) {},
          ),
        ],
      ),
    );
  }
}
