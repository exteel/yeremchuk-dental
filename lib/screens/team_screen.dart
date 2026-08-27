import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/doctor_card.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';

typedef _Doctor = ({String name, String position, String? quote});

typedef _Review = ({
  String authorName,
  String date,
  int rating,
  String text,
  String serviceTag,
  String doctorName,
});

const _cities = ['Івано-Франківськ', 'Чернівці'];

const _navItems = [
  'Послуги',
  'Про нас',
  'Ціни',
  'Стоматологічний туризм',
  'Для пацієнтів',
  'Контакти',
];

const _doctors = <_Doctor>[
  (
    name: 'Володимир Олександрович Єремчук',
    position: 'Засновник клініки, хірург-імплантолог',
    quote: '«Складний випадок — це не вирок, це завдання»',
  ),
  (
    name: 'Наталія Іванівна Гранда',
    position: 'Заступник головного лікаря, лікар-стоматолог',
    quote: null,
  ),
  (
    name: 'Любінець Марина Михайлівна',
    position: 'Дитячий стоматолог, загальний та терапевтичний прийом',
    quote: null,
  ),
  (
    name: 'Ірина Ростиславівна Янчинська',
    position: 'Лікар-стоматолог, пародонтолог',
    quote: null,
  ),
  (
    name: 'Наталія Іванівна Гранда',
    position: 'Заступник головного лікаря, лікар-стоматолог',
    quote: null,
  ),
  (
    name: 'Любінець Марина Михайлівна',
    position: 'Дитячий стоматолог, загальний та терапевтичний прийом',
    quote: null,
  ),
  (
    name: 'Ірина Ростиславівна Янчинська',
    position: 'Лікар-стоматолог, пародонтолог',
    quote: null,
  ),
  (
    name: 'Ірина Ростиславівна Янчинська',
    position: 'Лікар-стоматолог, пародонтолог',
    quote: null,
  ),
  (
    name: 'Наталія Іванівна Гранда',
    position: 'Заступник головного лікаря, лікар-стоматолог',
    quote: null,
  ),
];

final _reviews = List<_Review>.generate(
  4,
  (_) => (
    authorName: 'Оксана М.',
    date: '21.07.2026',
    rating: 4,
    text: 'Нарешті знайшла клініку, де пояснюють що роблять і чому. '
        'Ніякого тиску, ніяких несподіваних цін. Імплант поставили — і я '
        'забула, що він взагалі є.',
    serviceTag: 'Імплантація All-on-4',
    doctorName: 'Наталія Іванівна Гранда',
  ),
);

void _noop(String _) {}

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

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
          for (final label in _navItems)
            (
              label: label,
              onTap: switch (label) {
                'Послуги' => () => context.go(AppRoutes.category),
                'Про нас' => () => context.go(AppRoutes.about),
                'Ціни' => () => context.go(AppRoutes.prices),
                'Стоматологічний туризм' => () =>
                    context.go(AppRoutes.tourism),
                'Контакти' => () => context.go(AppRoutes.contacts),
                _ => () {},
              },
            ),
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
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBreadcrumbs(context),
                  const SizedBox(height: AppSpacing.lg),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop = constraints.maxWidth >= 900;

                      if (isDesktop) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildHeading(context)),
                            const SizedBox(width: AppSpacing.xl),
                            Expanded(child: _buildSubhead(context)),
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeading(context),
                          const SizedBox(height: AppSpacing.md),
                          _buildSubhead(context),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const FilterChipsRow(
                    options: [
                      'Всі',
                      'Імплантація',
                      'Ортодонтія',
                      'Вибілювання зубів',
                      'Веніри',
                    ],
                    selected: 'Всі',
                    onSelected: _noop,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop = constraints.maxWidth >= 900;
                      const gap = AppSpacing.lg;
                      final cardWidth = isDesktop
                          ? (constraints.maxWidth - gap * 3) / 4
                          : constraints.maxWidth;

                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final doctor in _doctors)
                            SizedBox(
                              width: cardWidth,
                              child: DoctorCard(
                                imagePath: '',
                                name: doctor.name,
                                position: doctor.position,
                                quote: doctor.quote,
                                ctaLabel: 'Детальніше',
                                onTap: () => context.go(AppRoutes.dentistProfile),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ВІДГУКИ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: AppColors.muted,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              'Що кажуть пацієнти про наших лікарів',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.ink,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      OutlinedButton(
                        onPressed: () => context.go(AppRoutes.reviews),
                        child: const Text('БІЛЬШЕ ВІДГУКІВ'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Text(
                        '4.9',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ink,
                                ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const Row(
                        children: [
                          Icon(Icons.star_rounded,
                              color: AppColors.amber, size: 18),
                          Icon(Icons.star_rounded,
                              color: AppColors.amber, size: 18),
                          Icon(Icons.star_rounded,
                              color: AppColors.amber, size: 18),
                          Icon(Icons.star_rounded,
                              color: AppColors.amber, size: 18),
                          Icon(Icons.star_rounded,
                              color: AppColors.amber, size: 18),
                        ],
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Container(width: 1, height: 20, color: AppColors.line),
                      const SizedBox(width: AppSpacing.md),
                      Text(
                        'Google Maps · 200+ відгуків',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.muted,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ArrowCarousel<_Review>(
                    items: _reviews,
                    itemWidth: 320,
                    itemBuilder: (context, review) => ReviewCard(
                      authorName: review.authorName,
                      date: review.date,
                      rating: review.rating,
                      text: review.text,
                      serviceTag: review.serviceTag,
                      doctorName: review.doctorName,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xl,
              ),
              child: const _AskDoctorForm(),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.cardRadius),
                ),
              ),
              child: LeadFormSection(
                eyebrow: '#ЄРІШЕННЯ',
                title: 'Знайдемо рішення\nдля вашої ситуації теж',
                subtitle: 'Запишіться на консультацію або напишіть нам. '
                    'Розберемось у ситуації, пояснимо варіанти, '
                    'зафіксуємо вартість.',
                services: const ['Дитяча стоматологія'],
                submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                onSubmit: (name, phone, service, date) {},
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    color: AppColors.navySoft,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.paper.withValues(alpha: 0.7),
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 200,
              cities: _cities,
              linkColumns: {
                'ПОСЛУГИ': [
                  (
                    label: 'Імплантація',
                    onTap: () => context.go(AppRoutes.category),
                  ),
                  (label: 'Ортодонтія', onTap: () {}),
                  (label: 'Вибілювання зубів', onTap: () {}),
                  (label: 'Профілактична стоматологія', onTap: () {}),
                  (label: 'Веніри естетичне протезування', onTap: () {}),
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
              phone: 'Запис за телефоном +38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: [
                (icon: Icons.send, onTap: () {}),
                (icon: Icons.camera_alt, onTap: () {}),
                (icon: Icons.chat_bubble, onTap: () {}),
                (icon: Icons.chat_bubble_outline, onTap: () {}),
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
          'Лікарі',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Text(
      'Лікарі, яким довіряють складні випадки',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.ink,
          ),
    );
  }

  Widget _buildSubhead(BuildContext context) {
    return Text(
      'Над вашою ситуацією працює не один лікар — а команда з вузькою '
      'спеціалізацією кожного. Для кожного випадку підбираємо команду '
      'фахівців.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.inkSoft,
          ),
    );
  }
}

class _AskDoctorForm extends StatelessWidget {
  const _AskDoctorForm();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final form = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ПИТАННЯ/ВІДПОВІДІ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Задайте питання лікарю',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Ви маєте питання?\nМи з радістю відповімо на нього',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Ім'я",
                      filled: true,
                      fillColor: AppColors.paper,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.chipRadius,
                        ),
                        borderSide: const BorderSide(color: AppColors.line),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Номер телефону',
                      filled: true,
                      fillColor: AppColors.paper,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.chipRadius,
                        ),
                        borderSide: const BorderSide(color: AppColors.line),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Ваше питання',
                filled: true,
                fillColor: AppColors.paper,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.teal,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.md,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSpacing.buttonRadius,
                    ),
                  ),
                ),
                child: const Text(
                  'ВІДПРАВИТИ',
                  style: TextStyle(
                    color: AppColors.paper,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );

        final photo = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            width: isWide ? 400 : double.infinity,
            height: 320,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 48,
            ),
          ),
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.paper,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: form),
                    const SizedBox(width: AppSpacing.lg),
                    photo,
                  ],
                )
              : Column(
                  children: [
                    form,
                    const SizedBox(height: AppSpacing.lg),
                    photo,
                  ],
                ),
        );
      },
    );
  }
}
