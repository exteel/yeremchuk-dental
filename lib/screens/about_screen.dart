import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/doctor_card.dart';
import 'package:yeremchuk_dental/widgets/faq_accordion.dart';
import 'package:yeremchuk_dental/widgets/feature_card.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/numbered_step_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        logoText: 'YEREMCHUK DENTAL',
        cities: const ['Івано-Франківськ', 'Чернівці'],
        selectedCity: 'Івано-Франківськ',
        onCityChanged: (city) {},
        onConsultationTap: () {},
        consultationLabel: 'Онлайн консультація',
        navItems: [
          (label: 'Послуги', onTap: () {}),
          (label: 'Про нас', onTap: () {}),
          (label: 'Ціни', onTap: () {}),
          (label: 'Стоматологічний туризм', onTap: () {}),
          (label: 'Для пацієнтів', onTap: () {}),
          (label: 'Контакти', onTap: () {}),
        ],
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(context),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildAboutClinicSection(context),
            ),
            Container(
              color: AppColors.paper,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildServicesSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildValuesSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: _buildVideoSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildAdvantagesSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildFounderSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildTeamSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildClinicsSection(context),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildCertificatesSection(context),
            ),
            Container(
              color: AppColors.paper,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _buildFaqSection(context),
            ),
            Container(
              color: AppColors.paper,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: LeadFormSection(
                title: 'Знайдемо рішення\nдля вашої ситуації теж',
                subtitle: 'Запишіться на консультацію або напишіть нам. '
                    'Розберемось у ситуації, пояснимо варіанти, зафіксуємо вартість.',
                services: const [
                  'Дитяча стоматологія',
                  'Імплантація',
                  'Ортодонтія',
                  'Протезування',
                ],
                submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                onSubmit: (name, phone, service, date) {},
                trailing: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppColors.muted,
                    size: 48,
                  ),
                ),
              ),
            ),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 0,
              cities: const ['Івано-Франківськ', 'Чернівці'],
              linkColumns: {
                'ПОСЛУГИ': [
                  (label: 'Імплантація', onTap: () {}),
                  (label: 'Ортодонтія', onTap: () {}),
                  (label: 'Вибілювання зубів', onTap: () {}),
                  (label: 'Профілактична стоматологія', onTap: () {}),
                  (label: 'Вініри естетичне протезування', onTap: () {}),
                  (label: 'Протезування', onTap: () {}),
                ],
                'ПОСЛУГИ ': [
                  (label: 'Видалення зубів', onTap: () {}),
                  (label: 'Лікування уві сні', onTap: () {}),
                  (label: 'Дитяча стоматологія', onTap: () {}),
                  (label: 'Лікування зубних каналів', onTap: () {}),
                  (label: 'Хірургічна стоматологія', onTap: () {}),
                  (label: 'Професійна гігієна', onTap: () {}),
                ],
                'ПАЦІЄНТАМ': [
                  (label: 'Про нас', onTap: () {}),
                  (label: 'Ціни', onTap: () {}),
                  (label: 'Стоматологічний туризм', onTap: () {}),
                  (label: 'Новини', onTap: () {}),
                  (label: 'Питання та відповіді', onTap: () {}),
                  (label: 'Контакти', onTap: () {}),
                ],
              },
              phone: '+38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: [
                (icon: Icons.send, onTap: () {}),
                (icon: Icons.camera_alt, onTap: () {}),
                (icon: Icons.chat, onTap: () {}),
                (icon: Icons.chat, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          final textColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Головна',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.muted,
                        ),
                  ),
                  Text(
                    ' / ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.muted,
                        ),
                  ),
                  Text(
                    'Про нас',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.ink,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
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
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '· Івано-Франківськ · Чернівці',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Сімейна стоматологія — для всієї родини',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                    ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Yeremchuk Dental — сімейна мережа клінік в Івано-Франківську '
                'та Чернівцях. Лікуємо всю родину: від перших зубчиків малюка '
                'до повного відновлення посмішки.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.md,
                runSpacing: AppSpacing.md,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('ДІЗНАТИСЬ ВАРТІСТЬ'),
                  ),
                ],
              ),
            ],
          );

          final image = ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            child: Container(
              height: 420,
              color: AppColors.cardBg,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_not_supported,
                color: AppColors.muted,
                size: 48,
              ),
            ),
          );

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: image),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              textColumn,
              const SizedBox(height: AppSpacing.lg),
              image,
            ],
          );
        },
      ),
    );
  }

  Widget _buildAboutClinicSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ПРО НАС',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final title = Text(
              'Про клініку',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            );
            final stats = Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _StatDivider(value: '9', label: 'досвідчених спеціалістів'),
                _StatDivider(value: '6+', label: 'років досвіду мережі'),
                _StatDivider(
                  value: '2',
                  label: 'клініки в двох містах',
                  showDividerAfter: false,
                ),
              ],
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: title),
                  stats,
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                const SizedBox(height: AppSpacing.lg),
                stats,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Ми — мережа клінік Yeremchuk Dental в Івано-Франківську та '
          'Чернівцях. Працюємо за сімейною моделлю: від догляду за молочними '
          'зубами малюків до комплексної імплантації для батьків, бабусь і '
          'дідусів.\n'
          'У нас повний цикл послуг — від точної діагностики до відновлення '
          'посмішки у складних випадках повної втрати зубів. Яка б не була '
          'ваша ситуація, у нас є рішення.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const Divider(color: AppColors.line, height: 1),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<int>(
          items: const [0, 1, 2],
          itemWidth: 320,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Container(
                height: 240,
                color: AppColors.cardBg,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported,
                  color: AppColors.muted,
                  size: 48,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    const services = [
      (
        title: 'ПРОФІЛАКТИЧНА СТОМАТОЛОГІЯ',
        highlighted: false,
        chips: <String>[],
      ),
      (
        title: 'ІМПЛАНТАЦІЯ ЗУБІВ',
        highlighted: true,
        chips: [
          'Одноетапна імплантація',
          'Повна імплантація',
          'Імплантація зубів All-on-4/6',
          'Одноетапна (експрес) імплантація зубів',
        ],
      ),
      (title: 'ОРТОДОНТІЯ', highlighted: false, chips: <String>[]),
      (title: 'ДИТЯЧА СТОМАТОЛОГІЯ', highlighted: false, chips: <String>[]),
      (title: 'ПРОТЕЗУВАННЯ ЗУБІВ', highlighted: false, chips: <String>[]),
      (title: 'ПРОФЕСІЙНА ГІГІЄНА', highlighted: false, chips: <String>[]),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ПОСЛУГИ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Основні послуги',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth >= 900 ? 3 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                mainAxisExtent: 220,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return _ServiceCard(
                  title: service.title,
                  highlighted: service.highlighted,
                  chips: service.chips,
                  onTap: () {},
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    const steps = [
      (
        number: 1,
        title: 'Пояснюємо просто',
        description:
            'Без складних медичних термінів. Розповідаємо, що відбувається '
                'на кожному етапі.',
      ),
      (
        number: 2,
        title: 'Даємо варіанти',
        description:
            'Не один шлях для всіх, а кілька рішень під вашу ситуацію.',
      ),
      (
        number: 3,
        title: 'Не тиснемо',
        description: 'Спокійний підхід. Ви вирішуєте, коли будете готові',
      ),
      (
        number: 4,
        title: 'Беремо складні випадки',
        description: 'Працюємо там, де інші іноді відмовляють',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'НАШІ ЦІННОСТІ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Як ми працюємо з пацієнтами',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth >= 900 ? 3 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                mainAxisExtent: 220,
              ),
              itemBuilder: (context, index) {
                if (index == steps.length) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                    child: Container(
                      color: AppColors.cardBg,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.muted,
                        size: 48,
                      ),
                    ),
                  );
                }
                final step = steps[index];
                return NumberedStepCard(
                  stepNumber: step.number,
                  title: step.title,
                  description: step.description,
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildVideoSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Container(
        height: 360,
        color: AppColors.cardBg,
        alignment: Alignment.center,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.5),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
        ),
      ),
    );
  }

  Widget _buildAdvantagesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ПЕРЕВАГИ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final title = Text(
              'Чому обирають Yeremchuk Dental',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            );
            final stats = Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _StatDivider(value: '3200+', label: 'імплантацій з 2010'),
                _StatDivider(
                  value: '12',
                  label: 'країн звідки їдуть пацієнти',
                ),
                _StatDivider(
                  value: '4.9',
                  label: 'рейтинг Google',
                  showDividerAfter: false,
                ),
              ],
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: title),
                  stats,
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                const SizedBox(height: AppSpacing.lg),
                stats,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.lg),
        const Divider(color: AppColors.line, height: 1),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth >= 900 ? 4 : 1;
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 0.85,
              children: const [
                FeatureCard(
                  icon: Icons.chat_bubble_outline,
                  title: 'Пояснюємо усі деталі. Зайвого не нав\'язуємо',
                  description:
                      'Роз\'яснюємо усі деталі лікування: можливі переваги і '
                          'недоліки. Жодного тиску. Рішення завжди за Вами',
                ),
                FeatureCard(
                  icon: Icons.savings_outlined,
                  title: 'Вартість фіксуємо першочергово',
                  description:
                      'Жодних сюрпризів – усе лікування згідно погодженого '
                          'плану. Є можливість розтермінування оплати від '
                          'ПриватБанк',
                ),
                FeatureCard(
                  icon: Icons.public,
                  title: 'Пацієнти у будь-якої точки світу',
                  description:
                      'Онлайн консультація перед приїздом в Україну. '
                          'Організовуємо лікування та перебування',
                ),
                FeatureCard(
                  icon: Icons.groups_outlined,
                  title: 'Професійна команда для складних викликів',
                  description:
                      'Складні випадки розглядаємо колегіально. Вирішуємо '
                          'проблему комплексно: хірург, ортопед, ендодонтист '
                          '– єдина команда',
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildFounderSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            height: 420,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 48,
            ),
          ),
        );

        final textColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ЗАСНОВНИК МЕРЕЖІ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Володимир Єремчук',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Yeremchuk Dental засновано лікарем-стоматологом Володимиром '
              'Олександровичем Єремчуком у березні 2019 року. За кілька '
              'років клініка виросла в мережу з двома локаціями — в '
              'Івано-Франківську та Чернівцях.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.inkSoft,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Для нас лікування — це не разове вирішення локальної '
              'проблеми, а комплексний підхід заради естетичного й '
              'довготривалого результату. І це лише початок: попереду '
              'розвиток мережі під єдиним брендом і єдиними стандартами.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.paper,
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '«СКЛАДНИЙ ВИПАДОК — ЦЕ НЕ ВИРОК, ЦЕ ЗАВДАННЯ»',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Володимир Єремчук, засновник\nYeremchuk Dental',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.inkSoft,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: image),
              const SizedBox(width: AppSpacing.xl),
              Expanded(child: textColumn),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            image,
            const SizedBox(height: AppSpacing.lg),
            textColumn,
          ],
        );
      },
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    const doctors = [
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'СПЕЦІАЛІСТИ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final title = Text(
              'Команда лікарів, якій довіряють',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            );
            final subtitle = SizedBox(
              width: isWide ? 380 : double.infinity,
              child: Text(
                'Над вирішенням Вашої стоматологічної проблеми працює '
                'команда досвідчених спеціалістів',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              ),
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: title),
                  subtitle,
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
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<({String name, String position, String? quote})>(
          items: doctors,
          itemWidth: 300,
          itemBuilder: (context, doctor) {
            return DoctorCard(
              imagePath: '',
              name: doctor.name,
              position: doctor.position,
              quote: doctor.quote,
              ctaLabel: 'Детальніше',
              onTap: () {},
            );
          },
        ),
      ],
    );
  }

  Widget _buildClinicsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'МЕРЕЖА КЛІНІК',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Наші клініки',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;

            final list = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _ClinicListItem(
                  city: 'Івано-Франківськ',
                  address: 'Вул. Військова 1',
                ),
                SizedBox(height: AppSpacing.md),
                _ClinicListItem(
                  city: 'Чернівці',
                  address: 'вул. Руська, 237',
                ),
                SizedBox(height: AppSpacing.md),
                _ClinicListItem(
                  city: 'Івано-Франківськ',
                  address: 'Вул. Військова 1',
                  badgeLabel: 'НЕЗАБАРОМ ВІДКРИТТЯ',
                ),
              ],
            );

            final map = ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Container(
                height: 360,
                color: AppColors.cardBg,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.map_outlined,
                  color: AppColors.muted,
                  size: 48,
                ),
              ),
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 320, child: list),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(child: map),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                list,
                const SizedBox(height: AppSpacing.lg),
                map,
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildCertificatesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ЯКІСТЬ ПОСЛУГ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final title = Text(
              'Сертифікати',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            );
            final subtitle = SizedBox(
              width: isWide ? 380 : double.infinity,
              child: Text(
                'Наші досвідчені спеціалісти постінно вчаться і '
                'використовують новітні методики для лікування наших '
                'пацієнтів',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              ),
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: title),
                  subtitle,
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
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<int>(
          items: const [0, 1, 2, 3],
          itemWidth: 260,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Container(
                height: 340,
                color: AppColors.cardBg,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported,
                  color: AppColors.muted,
                  size: 48,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFaqSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQ',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Часті питання',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        FaqAccordion(
          items: const [
            FaqItem(
              question: 'Чи боляче лікувати зуби?',
              answer: 'Стоматологічна галузь у наш час пропонує різноманітні '
                  'методи знеболення. «Без болю» у сучасній стоматології – '
                  'небезпідставне формулювання, адже доступною є метода '
                  'лікування в седації. Це контрольований медикаментозний '
                  'сон, коли пацієнту пропонують проведення усіх маніпуляцій '
                  'уві сні під контролем анестезіолога.',
            ),
            FaqItem(
              question: 'Скільки коштує консультація?',
              answer: '',
            ),
            FaqItem(
              question: 'Чи можна лікувати зуби уві сні?',
              answer: '',
            ),
            FaqItem(
              question: 'Що робити, якщо я боюсь стоматолога?',
              answer: '',
            ),
            FaqItem(
              question: 'Як записатись на прийом?',
              answer: '',
            ),
          ],
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider({
    required this.value,
    required this.label,
    this.showDividerAfter = true,
  });

  final String value;
  final String label;
  final bool showDividerAfter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
              ],
            ),
          ),
          if (showDividerAfter)
            const SizedBox(
              height: 48,
              child: VerticalDivider(color: AppColors.line, width: 1),
            ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.title,
    required this.highlighted,
    required this.chips,
    required this.onTap,
  });

  final String title;
  final bool highlighted;
  final List<String> chips;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.paper : AppColors.paperDim,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Column(
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
            child: const Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          if (chips.isNotEmpty) ...[
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.ink,
                              ),
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.ink),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Divider(color: AppColors.line, height: 1),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: chips
                  .map(
                    (chip) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.paperDim,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.chipRadius),
                      ),
                      child: Text(
                        chip,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ] else
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.ink,
                              ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.line),
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 18,
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

class _ClinicListItem extends StatelessWidget {
  const _ClinicListItem({
    required this.city,
    required this.address,
    this.badgeLabel,
  });

  final String city;
  final String address;
  final String? badgeLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badgeLabel != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.tealSoft,
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              ),
              child: Text(
                badgeLabel!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.tealDark,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.teal,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      city,
                      style:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.ink,
                              ),
                    ),
                    Text(
                      address,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.inkSoft,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
