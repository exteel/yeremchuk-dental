import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/faq_accordion.dart';
import 'package:yeremchuk_dental/widgets/feature_card.dart';
import 'package:yeremchuk_dental/widgets/google_logo.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/numbered_step_card.dart';
import 'package:yeremchuk_dental/widgets/patient_story_card.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';

class TourismScreen extends StatelessWidget {
  const TourismScreen({super.key});

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
          (label: 'Стоматологічний туризм', onTap: () {}),
          (label: 'Для пацієнтів', onTap: () {}),
          (label: 'Контакти', onTap: () => context.go(AppRoutes.contacts)),
        ],
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(context),
            _buildAdvantagesSection(context),
            _buildWhatYouGetSection(context),
            _buildPricingSection(context),
            _buildConsultationBanner(context),
            _buildCasesSection(context),
            _buildProcessSection(context),
            _buildTrustSection(context),
            _buildCtaImageBanner(context),
            _buildReviewsSection(context),
            _buildFaqSection(context),
            _buildLeadFormSection(context),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 200,
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
                  (
                    label: 'Про нас',
                    onTap: () => context.go(AppRoutes.about),
                  ),
                  (
                    label: 'Ціни',
                    onTap: () => context.go(AppRoutes.prices),
                  ),
                  (label: 'Стоматологічний туризм', onTap: () {}),
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
                (icon: Icons.chat, onTap: () {}),
                (icon: Icons.local_phone, onTap: () {}),
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          final textColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const _Breadcrumb(),
              const SizedBox(height: AppSpacing.lg),
              const _GoogleRatingBadge(
                trailingText: 'Івано-Франківськ · Чернівці',
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Стоматологічне лікування в Україні — з повним супроводом',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                    ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'План, лікування і організація поїздки — від першого дзвінка '
                'до виїзду додому.',
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                    ),
                    child: const Text('ОТРИМАТИ ПЛАН ЛІКУВАННЯ'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                    ),
                    child: const Text('НАДІСЛАТИ КТ'),
                  ),
                ],
              ),
            ],
          );

          final image = ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            child: Container(
              height: isWide ? 420 : 320,
              color: AppColors.cardBg,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                color: AppColors.muted,
                size: 48,
              ),
            ),
          );

          if (!isWide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                textColumn,
                const SizedBox(height: AppSpacing.lg),
                image,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: textColumn),
              const SizedBox(width: AppSpacing.xl),
              Expanded(child: image),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAdvantagesSection(BuildContext context) {
    return Container(
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final header = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ПЕРЕВАГИ',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.muted,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Чому приїжджають до України',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                ],
              );

              const stats = Wrap(
                spacing: AppSpacing.xl,
                runSpacing: AppSpacing.md,
                children: [
                  _StatItem(value: '3200+', label: 'імплантацій з 2010'),
                  _StatItem(value: '12', label: 'країн звідки їдуть пацієнти'),
                  _StatItem(value: '4.9', label: 'рейтинг Google'),
                ],
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: AppSpacing.xl),
                    stats,
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
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
              final isWide = constraints.maxWidth >= 900;
              final cards = const [
                FeatureCard(
                  icon: Icons.medical_services_outlined,
                  title: 'Сучасне обладнання',
                  description: 'Працюємо на сучасному обладнанні та '
                      'використовуємо перевірені технології для точної '
                      'діагностики й лікування.',
                ),
                FeatureCard(
                  icon: Icons.attach_money,
                  title: 'Комплексні рішення',
                  description: 'Від діагностики та планування до лікування '
                      'й відновлення — усі необхідні процедури можна '
                      'пройти в одному місці.',
                ),
                FeatureCard(
                  icon: Icons.public,
                  title: 'Нижча вартість',
                  description: 'Якісне стоматологічне лікування в Україні '
                      'коштує значно доступніше, ніж у більшості країн '
                      'Європи.',
                ),
                FeatureCard(
                  icon: Icons.groups_outlined,
                  title: 'Професійна команда для складних викликів',
                  description: 'Складні випадки розглядаємо колегіально. '
                      'Вирішуємо проблему комплексно: хірург, ортопед, '
                      'ендодонтист – єдина команда',
                ),
              ];

              if (isWide) {
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

  Widget _buildWhatYouGetSection(BuildContext context) {
    final cards = const [
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'ПЛАН ЛІКУВАННЯ',
        description: 'Отримуєте зрозумілий покроковий план із переліком '
            'необхідних процедур та прогнозованими термінами лікування.',
      ),
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'ВАРІАНТИ І ВАРТІСТЬ',
        description: 'Пропонуємо можливі варіанти лікування та заздалегідь '
            'розраховуємо їхню вартість — без неочікуваних витрат.',
      ),
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'СУПРОВІД НА КОЖНОМУ ЕТАПІ',
        description: 'Залишаємося на зв\'язку до, під час і після '
            'лікування. Допомагаємо з усіма питаннями протягом усього '
            'процесу.',
      ),
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'КООРДИНАЦІЯ ВІЗИТІВ',
        description: 'Плануємо прийоми так, щоб пройти необхідне лікування '
            'оптимально за часом і без зайвих візитів.',
      ),
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'ЖИТЛО ТА ТРАНСФЕР',
        description: 'Допомагаємо підібрати комфортне житло поруч із '
            'клінікою та організувати трансфер, щоб вам не довелося '
            'самостійно вирішувати питання логістики.',
      ),
      FeatureCard(
        icon: Icons.medical_services_outlined,
        title: 'ПЛАНУВАННЯ ЧАСУ ПЕРЕБУВАННЯ',
        description: 'Заздалегідь формуємо графік лікування та візитів, '
            'щоб ви точно знали, скільки часу потрібно запланувати на '
            'поїздку.',
      ),
    ];

    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final header = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ЩО ВИ ОТРИМАЄТЕ',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.muted,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Усе в одному місці',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
                  ),
                ],
              );

              final subtitle = Text(
                'Вам не треба думати про логістику окремо — про це '
                'подбаємо ми.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(child: subtitle),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
                  const SizedBox(height: AppSpacing.sm),
                  subtitle,
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              if (isWide) {
                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    for (final card in cards)
                      SizedBox(
                        width: (constraints.maxWidth - AppSpacing.md * 2) / 3,
                        child: card,
                      ),
                  ],
                );
              }

              return ArrowCarousel<Widget>(
                items: cards,
                itemWidth: 260,
                itemBuilder: (context, item) => item,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPricingSection(BuildContext context) {
    return Container(
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final header = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ВАРТІСТЬ',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.muted,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Скільки ви заощадите',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
                  ),
                ],
              );

              final subtitle = Text(
                'У більшості випадків лікування в Україні вигідніше, ніж у '
                'вашій країні — ось порівняння на 5 найпопулярніших '
                'послугах.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(child: subtitle),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
                  const SizedBox(height: AppSpacing.sm),
                  subtitle,
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          const _PriceComparisonTable(
            rows: [
              _PriceRow(
                service: 'Імплантація (1 зуб)',
                ukraine: 'від €450',
                europe: 'від €2 500',
                savings: 'до 80%',
              ),
              _PriceRow(
                service: 'All-on-4 (одна щелепа)',
                ukraine: 'від €2 850',
                europe: 'від €9 000',
                savings: 'до 65%',
              ),
              _PriceRow(
                service: 'Коронка (цирконій)',
                ukraine: 'від €350',
                europe: 'від €900',
                savings: 'до 60%',
              ),
              _PriceRow(
                service: 'Вініри (e-max)',
                ukraine: 'від €300',
                europe: 'від €600',
                savings: 'до 50%',
              ),
              _PriceRow(
                service: 'Ортодонтія (брекети)',
                ukraine: 'від €600',
                europe: 'від €3 500',
                savings: 'до 80%',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConsultationBanner(BuildContext context) {
    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Stack(
          children: [
            Container(
              height: 420,
              width: double.infinity,
              color: AppColors.cardBg,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                color: AppColors.muted,
                size: 48,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.paper.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppSpacing.cardRadius),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Консультація без тиску. Рішення за Вами',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Маєте питання та сумніви щодо лікування в Україні?',
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.ink,
                              ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'На консультації лікар пояснить варіанти з плюсами і '
                      'мінусами кожного. Без тиску. Рішення за вами.',
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.inkSoft,
                              ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.teal,
                      ),
                      child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
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

  Widget _buildCasesSection(BuildContext context) {
    return Container(
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'КЕЙСИ',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.muted,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Історії, що надихають',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ArrowCarousel<Widget>(
            items: [
              PatientStoryCard(
                imagePath: '',
                name: 'Марія, 54 роки · Відень, Австрія',
                metaLine: 'All-on-6 · 2 візити · Постійний протез · '
                    '#єрішення',
                quote: 'Я 8 років не фотографувалась у повну посмішку. '
                    'Ховала рот на фото, уникала сміятись на людях. За два '
                    'візити повернула те, що вважала назавжди втраченим.',
                detailsLabel: 'Детальніше',
                onDetailsTap: () {},
              ),
              const _BeforeAfterStoryCard(
                name: 'Марія, 54 роки · Відень, Австрія',
                metaLine: 'All-on-6 · 2 візити · Постійний протез · '
                    '#єрішення',
                quote: 'Я 8 років не фотографувалась у повну посмішку. '
                    'Ховала рот на фото, уникала сміятись на людях. За два '
                    'візити повернула те, що вважала назавжди втраченим.',
              ),
            ],
            itemWidth: 320,
            itemBuilder: (context, item) => item,
          ),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: OutlinedButton(
              onPressed: () => context.go(AppRoutes.cases),
              child: const Text('ПОДИВИТИСЬ ВСІ ІСТОРІЇ'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessSection(BuildContext context) {
    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ПРОЦЕС ЛІКУВАННЯ',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.muted,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Як проходить лікування в Yeremchuk Dental',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;
              final steps = const [
                _StepData(
                  number: 1,
                  label: 'крок 1',
                  title: 'Надсилаєте КТ',
                  description: 'Надсилаєте нам КТ-знімок щелепи. Лікарі '
                      'оцінюють ситуацію та визначають можливі варіанти '
                      'лікування.',
                ),
                _StepData(
                  number: 2,
                  label: 'крок 2',
                  title: 'Складаємо план',
                  description: 'Готуємо персональний план лікування з '
                      'етапами, термінами та попередньо розрахованою '
                      'вартістю.',
                ),
                _StepData(
                  number: 3,
                  label: 'крок 3',
                  title: 'Узгоджуємо дати',
                  description: 'Разом обираємо зручні дати приїзду та '
                      'формуємо графік процедур на час вашого перебування '
                      'в Україні.',
                ),
                _StepData(
                  number: 4,
                  label: 'крок 4',
                  title: 'Приїжджаєте',
                  description: 'Зустрічаємо вас у клініці, проводимо очну '
                      'консультацію та необхідну діагностику перед '
                      'початком лікування.',
                ),
                _StepData(
                  number: 5,
                  label: 'крок 5',
                  title: 'Проводимо лікування',
                  description: 'Проводимо заплановане лікування та '
                      'супроводжуємо вас на кожному етапі — до отримання '
                      'фінального результату.',
                ),
              ];

              final stepWidgets = [
                for (final step in steps) _StepBlock(step: step),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                  child: Container(
                    color: AppColors.cardBg,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_outlined,
                      color: AppColors.muted,
                      size: 48,
                    ),
                  ),
                ),
              ];

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < stepWidgets.length; i++) ...[
                      Expanded(child: stepWidgets[i]),
                      if (i < stepWidgets.length - 1)
                        const SizedBox(width: AppSpacing.md),
                    ],
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < stepWidgets.length; i++) ...[
                    stepWidgets[i],
                    if (i < stepWidgets.length - 1)
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

  Widget _buildTrustSection(BuildContext context) {
    return Container(
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
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
          Text(
            'Чому варто довіритись нам',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final image = ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                child: Container(
                  height: 360,
                  color: AppColors.cardBg,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppColors.muted,
                    size: 48,
                  ),
                ),
              );

              const checklist = Column(
                children: [
                  _CheckItem(
                    question: 'Як я можу бути впевненим у плані та '
                        'вартості ще до приїзду?',
                    answer: 'Надсилаємо письмовий план лікування і '
                        'вартість після аналізу КТ — до вашого приїзду і '
                        'оплати',
                  ),
                  SizedBox(height: AppSpacing.md),
                  _CheckItem(
                    question: 'А якщо щось піде не так?',
                    answer: 'Плануємо кожен етап наперед і завжди '
                        'тримаємо запасний варіант',
                  ),
                  SizedBox(height: AppSpacing.md),
                  _CheckItem(
                    question: 'А якщо потрібно кілька візитів?',
                    answer: 'Розбиваємо лікування на етапи — так, щоб '
                        'кожна поїздка мала сенс',
                  ),
                  SizedBox(height: AppSpacing.md),
                  _CheckItem(
                    question: 'А якщо я не розумію план лікування?',
                    answer: 'Пояснюємо простими словами, без термінів — '
                        'до, під час і після лікування',
                  ),
                ],
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: image),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(child: checklist),
                  ],
                );
              }

              return Column(
                children: [
                  image,
                  const SizedBox(height: AppSpacing.lg),
                  checklist,
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCtaImageBanner(BuildContext context) {
    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Stack(
          children: [
            Container(
              height: 340,
              width: double.infinity,
              color: AppColors.cardBg,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                color: AppColors.muted,
                size: 48,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.all(AppSpacing.lg),
                color: AppColors.line.withValues(alpha: 0.9),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Почніть з плану лікування вже сьогодні',
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.ink,
                              ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Розберемо вашу ситуацію ще до приїзду',
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.inkSoft,
                              ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.teal,
                          ),
                          child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('ЗАВАНТАЖИТИ КТ'),
                        ),
                      ],
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

  Widget _buildReviewsSection(BuildContext context) {
    return Container(
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final header = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ВІДГУКИ',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.muted,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Що кажуть пацієнти',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
                  ),
                ],
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: AppSpacing.xl),
                    const _ReviewsSummary(),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
                  const SizedBox(height: AppSpacing.md),
                  const _ReviewsSummary(),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          ArrowCarousel<int>(
            items: const [0, 1, 2, 3],
            itemWidth: 300,
            itemBuilder: (context, item) => const ReviewCard(
              authorName: 'Оксана М.',
              date: '21.07.2026',
              rating: 4,
              text: 'Нарешті знайшла клініку, де пояснюють що роблять і '
                  'чому. Ніякого тиску, ніяких несподіваних цін. Імплант '
                  'поставили — і я забула, що він взагалі є.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqSection(BuildContext context) {
    return Container(
      color: AppColors.paper,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              final header = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
                  ),
                ],
              );

              const accordion = FaqAccordion(
                items: [
                  FaqItem(
                    question: 'Чи боляче лікувати зуби?',
                    answer: 'Стоматологічна галузь у наш час пропонує '
                        'різноманітні методи знеболення. «Без болю» у '
                        'сучасній стоматології – небезпідставне '
                        'формулювання, адже доступною є метода лікування в '
                        'седації. Це контрольований медикаментозний сон, '
                        'коли пацієнту пропонують проведення усіх '
                        'маніпуляцій уві сні під контролем анестезіолога.',
                  ),
                  FaqItem(
                    question: 'Скільки коштує консультація?',
                    answer: '',
                  ),
                  FaqItem(
                    question: 'Чи можна лікувати зуби усі сні?',
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
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(flex: 2, child: accordion),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
                  const SizedBox(height: AppSpacing.lg),
                  accordion,
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeadFormSection(BuildContext context) {
    return Container(
      color: AppColors.navy,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: LeadFormSection(
        eyebrow: '#ЄРІШЕННЯ',
        title: 'Знайдемо рішення для вашої ситуації теж',
        subtitle: 'Запишіться на консультацію або напишіть нам. '
            'Розберемось у ситуації, пояснимо варіанти, зафіксуємо '
            'вартість.',
        services: const ['Дитяча стоматологія'],
        submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
        onSubmit: (name, phone, service, date) {},
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            width: 320,
            height: 260,
            color: AppColors.navySoft,
            alignment: Alignment.center,
            child: Icon(
              Icons.image_outlined,
              color: AppColors.paper.withValues(alpha: 0.7),
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.muted,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        return Text(
          isWide
              ? 'Головна / Стоматологічний туризм'
              : 'Головна / Імплантація / All-on-4 / All-on-6',
          style: style,
        );
      },
    );
  }
}

class _GoogleRatingBadge extends StatelessWidget {
  const _GoogleRatingBadge({required this.trailingText});

  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.sm,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.paper,
            border: Border.all(color: AppColors.line),
            borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GoogleLogo(size: 16),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '4.9 Google',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
              ),
            ],
          ),
        ),
        Text(
          '· $trailingText',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.muted,
              ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
      ],
    );
  }
}

class _PriceRow {
  const _PriceRow({
    required this.service,
    required this.ukraine,
    required this.europe,
    required this.savings,
  });

  final String service;
  final String ukraine;
  final String europe;
  final String savings;
}

class _PriceComparisonTable extends StatelessWidget {
  const _PriceComparisonTable({required this.rows});

  final List<_PriceRow> rows;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        if (isWide) {
          return _buildTable(context);
        }

        return _buildCardList(context);
      },
    );
  }

  Widget _buildTable(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Column(
        children: [
          Container(
            color: AppColors.line,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Послуга',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Україна',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Європа',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Економія',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                ),
              ],
            ),
          ),
          for (var i = 0; i < rows.length; i++)
            Container(
              color: i.isEven ? AppColors.paper : AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      rows[i].service,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      rows[i].ukraine,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      rows[i].europe,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.muted,
                              ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tealSoft,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.chipRadius),
                      ),
                      child: Text(
                        rows[i].savings,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: AppColors.tealDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCardList(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Column(
        children: [
          Container(
            color: AppColors.line,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Text(
                  'Порівняння цін',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                ),
                const Spacer(),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          for (var i = 0; i < rows.length; i++)
            Container(
              color: i.isEven ? AppColors.paper : AppColors.paperDim,
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rows[i].service,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'УКРАЇНА',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.muted,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            Text(
                              rows[i].ukraine,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ЄВРОПА',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.muted,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            Text(
                              rows[i].europe,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.muted),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tealSoft,
                          borderRadius:
                              BorderRadius.circular(AppSpacing.chipRadius),
                        ),
                        child: Text(
                          rows[i].savings,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: AppColors.tealDark,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
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

class _BeforeAfterStoryCard extends StatelessWidget {
  const _BeforeAfterStoryCard({
    required this.name,
    required this.metaLine,
    required this.quote,
  });

  final String name;
  final String metaLine;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        color: AppColors.cardBg,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: _labelledPlaceholder(context, 'До'),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: _labelledPlaceholder(context, 'Після'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metaLine,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.muted,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  quote,
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

  Widget _labelledPlaceholder(BuildContext context, String label) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_outlined,
              color: AppColors.muted,
              size: 32,
            ),
          ),
        ),
        Positioned(
          left: AppSpacing.sm,
          top: AppSpacing.sm,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.paper,
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}

class _StepData {
  const _StepData({
    required this.number,
    required this.label,
    required this.title,
    required this.description,
  });

  final int number;
  final String label;
  final String title;
  final String description;
}

class _StepBlock extends StatelessWidget {
  const _StepBlock({required this.step});

  final _StepData step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.md,
            bottom: AppSpacing.xs,
          ),
          child: Text(
            step.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.muted,
                  letterSpacing: 1.2,
                ),
          ),
        ),
        NumberedStepCard(
          stepNumber: step.number,
          title: step.title,
          description: step.description,
        ),
      ],
    );
  }
}

class _CheckItem extends StatelessWidget {
  const _CheckItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.teal,
            child: Icon(Icons.check, color: AppColors.paper, size: 16),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style:
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.ink,
                          ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  answer,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkSoft,
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

class _ReviewsSummary extends StatelessWidget {
  const _ReviewsSummary();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      children: [
        Text(
          '4.9',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rounded,
              color: AppColors.teal,
              size: 20,
            ),
          ),
        ),
        Container(width: 1, height: 24, color: AppColors.line),
        Text(
          'Google Maps · 200+ відгуків',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.muted,
              ),
        ),
      ],
    );
  }
}
