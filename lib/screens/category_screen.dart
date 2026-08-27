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
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/numbered_step_card.dart';
import 'package:yeremchuk_dental/widgets/patient_story_card.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';
import 'package:yeremchuk_dental/widgets/stat_badge.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          (label: 'Послуги', onTap: () {}),
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
            const _HeroSection(),
            _sectionWrap(
              background: AppColors.paper,
              child: const _CaseFinderSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _AdvantagesSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _ManufacturersSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _ImportantToKnowSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _CasesSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _AlternativeOpinionSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _ComparisonSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _DoctorConsultSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _ProcessSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _VideoFaqSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _CostSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _DentalTourismSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _CalculatorSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: const _FaqSection(),
            ),
            _sectionWrap(
              background: AppColors.paper,
              child: const _ReviewsSection(),
            ),
            _sectionWrap(
              background: AppColors.paperDim,
              child: LeadFormSection(
                title: 'Знайдемо рішення для вашої ситуації теж',
                subtitle: 'Запишіться на консультацію або напишіть нам. '
                    'Розберемось у ситуації, пояснимо варіанти, зафіксуємо '
                    'вартість.',
                services: const ['Дитяча стоматологія'],
                submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                onSubmit: (name, phone, service, date) {},
                trailing: const _ImagePlaceholder(
                  icon: Icons.medical_information_outlined,
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
                'ПОСЛУГИ': [
                  (label: 'Імплантація', onTap: () {}),
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

Widget _sectionWrap({required Color background, required Widget child}) {
  return Container(
    width: double.infinity,
    color: background,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xl,
    ),
    child: child,
  );
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({
    required this.icon,
    this.width,
    this.height,
    this.iconSize = 48,
    this.borderRadius,
  });

  final IconData icon;
  final double? width;
  final double? height;
  final double iconSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ?? BorderRadius.circular(AppSpacing.cardRadius),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: AppColors.cardBg,
        child: Icon(
          icon,
          size: iconSize,
          color: AppColors.muted,
        ),
      ),
    );
  }
}

class _SectionEyebrowTitle extends StatelessWidget {
  const _SectionEyebrowTitle({required this.eyebrow, required this.title});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.paperDim,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Головна / Імплантація',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.muted,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Імплантація зубів в Івано-Франківську – є рішення!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Цифрова імплантація за шаблоном в Yeremchuk Dental. Виглядає '
            'і жується як власний зуб. Без знімних протезів, без '
            'обточування сусідніх. Одне рішення на все життя.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.inkSoft,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
          ),
          const SizedBox(height: AppSpacing.lg),
          const StatBadge(value: '6+', label: 'років досвіду мережі'),
          const SizedBox(height: AppSpacing.lg),
          const _ImagePlaceholder(
            icon: Icons.medical_services_outlined,
            width: double.infinity,
            height: 240,
            iconSize: 72,
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: const [
              StatBadge(value: '98%', label: 'Приживлення імплантів'),
              StatBadge(value: '4.9', label: 'на Google (170+ відгуків)'),
            ],
          ),
        ],
      ),
    );
  }
}

class _CaseFinderSection extends StatelessWidget {
  const _CaseFinderSection();

  static const _cases = [
    (
      title: 'Втратив один зуб',
      description: 'Хочу надійно і назавжди. Без обточування сусідніх зубів.',
      tag: 'ОДНОЕТАПНА ІМПЛАНТАЦІЯ',
    ),
    (
      title: 'Видаляють зуб — хочу імплант одразу',
      description: 'В той же день — без очікування і додаткових візитів.',
      tag: 'ОДНОМОМЕНТНА ІМПЛАНТАЦІЯ',
    ),
    (
      title: 'Приїхав з-за кордону',
      description: 'Обмежений час — треба все швидко і за мінімум візитів.',
      tag: 'ЕКСПРЕС ІМПЛАНТАЦІЯ',
    ),
    (
      title: 'Хочу все включено',
      description: 'Без сюрпризів по ціні. Один договір — повний результат.',
      tag: 'ОДНОЕТАПНА ІМПЛАНТАЦІЯ',
    ),
    (
      title: 'Немає більшості або всіх зубів',
      description: 'Кілька або більшість зубів відсутні. Хочу повноцінне '
          'відновлення.',
      tag: 'ALL-ON-6',
    ),
    (
      title: 'Відмовили через атрофію кістки',
      description: 'Сказали кістки замало. Але і для цього є рішення.',
      tag: 'ALL-ON-4',
    ),
    (
      title: 'Хочу розібратись що таке імплантація',
      description: 'Перший крок — зрозуміти варіанти і з чого почати.',
      tag: 'ДЕНТАЛЬНА ІМПЛАНТАЦІЯ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'ВИДИ ІМПЛАНТАЦІЇ',
          title: 'Знайдіть свій випадок — підберемо рішення',
        ),
        const SizedBox(height: AppSpacing.lg),
        const _ImagePlaceholder(
          icon: Icons.person_outline,
          width: double.infinity,
          height: 260,
          iconSize: 72,
        ),
        const SizedBox(height: AppSpacing.lg),
        for (final item in _cases) ...[
          _CaseCard(
            title: item.title,
            description: item.description,
            tag: item.tag,
            onTap: item.tag == 'ALL-ON-4' || item.tag == 'ALL-ON-6'
                ? () => context.go(AppRoutes.subcategory)
                : () {},
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        Material(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'МАЄТЕ ІНШУ СИТУАЦІЮ? НАДІШЛІТЬ НАМ ПОВІДОМЛЕННЯ',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: AppColors.paper,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.paper,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CaseCard extends StatelessWidget {
  const _CaseCard({
    required this.title,
    required this.description,
    required this.tag,
    required this.onTap,
  });

  final String title;
  final String description;
  final String tag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(AppSpacing.sm),
            ),
            child: const Icon(
              Icons.circle_outlined,
              color: AppColors.paper,
              size: 20,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                ),
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.line, height: 1),
          const SizedBox(height: AppSpacing.md),
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    tag,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.muted,
                          letterSpacing: 1.1,
                        ),
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: AppColors.line),
                    ),
                  ),
                  child: const Icon(Icons.chevron_right, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AdvantagesSection extends StatelessWidget {
  const _AdvantagesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'ПЕРЕВАГИ',
          title: 'Чому обирають імплантацію в Yeremchuk Dental',
        ),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.md,
          children: const [
            _PlainStat(value: '3200+', label: 'імплантацій з 2010'),
            _PlainStat(value: '15', label: 'років гарантії'),
            _PlainStat(value: '4.9', label: 'рейтинг Google'),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        const Divider(color: AppColors.line, height: 1),
        const SizedBox(height: AppSpacing.lg),
        const FeatureCard(
          icon: Icons.chat_bubble_outline,
          title: 'Особиста консультація засновника',
          description: 'Детально роз\'яснюємо усі деталі майбутнього '
              'лікування. Можливі переваги і недоліки. Наводимо аргументи '
              'із практичного досвіду. Жодного тиску. Рішення завжди за '
              'Вами',
        ),
        const SizedBox(height: AppSpacing.md),
        const FeatureCard(
          icon: Icons.savings_outlined,
          title: 'Цифрове планування імплантації',
          description: 'Жодних сюрпризів у фіналі лікування. Усі процедури '
              'відповідно до погодженого плану. За потреби – є можливість '
              'розтермінування оплати від ПриватБанк на 6 місяців.',
        ),
        const SizedBox(height: AppSpacing.md),
        const FeatureCard(
          icon: Icons.public,
          title: 'Одномоментна імплантація',
          description: 'Онлайн консультація наших спеціалістів перед '
              'поїздкою в Україну. Організовуємо лікування та перебування. '
              'Пацієнти з Австрії, Польщі, Ізраїлю та інших країн.',
        ),
        const SizedBox(height: AppSpacing.md),
        const FeatureCard(
          icon: Icons.groups_outlined,
          title: 'Команда на складний випадок',
          description: 'Складні випадки розглядаємо колегіально. '
              'Вирішуємо проблему комплексно якщо одному спеціалісту це не '
              'під силу. Хірург, ортопед, ендодонтист, анестезіолог – '
              'єдина команда.',
        ),
      ],
    );
  }
}

class _PlainStat extends StatelessWidget {
  const _PlainStat({required this.value, required this.label});

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
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
      ],
    );
  }
}

class _ManufacturersSection extends StatelessWidget {
  const _ManufacturersSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'СВІТОВІ ВИРОБНИКИ',
          title: 'Працюємо з провідними виробниками імплантів світу',
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Ми підбираємо імплантаційну систему індивідуально для кожного '
          'пацієнта та працюємо лише з оригінальною продукцією офіційних '
          'виробників. У нашій практиці використовуються сертифіковані '
          'імплантаційні системи, що відповідають міжнародним стандартам '
          'якості та мають офіційну гарантію виробника. Завдяки співпраці '
          'з кількома провідними брендами ми можемо запропонувати рішення '
          'для різних клінічних випадків і бюджетів, обираючи оптимальний '
          'варіант саме для вас.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: const [
            _ManufacturerChip(name: 'straumann'),
            _ManufacturerChip(name: 'NEODENT'),
            _ManufacturerChip(name: 'OSSTEM IMPLANT'),
            _ManufacturerChip(name: 'MEGAGEN'),
            _ManufacturerChip(name: 'Nobel Biocare'),
          ],
        ),
      ],
    );
  }
}

class _ManufacturerChip extends StatelessWidget {
  const _ManufacturerChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        border: Border.all(color: AppColors.line),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
            ),
      ),
    );
  }
}

class _ImportantToKnowSection extends StatelessWidget {
  const _ImportantToKnowSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paperDim,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionEyebrowTitle(
            eyebrow: 'ВАЖЛИВО ЗНАТИ',
            title: 'Що відбувається, якщо відкласти імплантацію?',
          ),
          const SizedBox(height: AppSpacing.lg),
          const _ChecklistTile(
            text: 'Кістка на місці відсутнього зуба починає '
                'розсмоктуватись вже через 3–6 місяців',
          ),
          const _ChecklistTile(
            text: 'Чим довше немає зуба — тим більший об\'єм кісткової '
                'пластики може знадобитись',
          ),
          const _ChecklistTile(
            text: 'Сусідні зуби поступово зміщуються, змінюється прикус. '
                'Відновлення стає складнішим і дорожчим',
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Запишіться на консультацію для вирішення вашої поточної '
            'ситуації',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ЗАПИСАТИСЬ НА ПРИЙОМ'),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _ImagePlaceholder(
            icon: Icons.image_outlined,
            width: double.infinity,
            height: 220,
          ),
        ],
      ),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.teal, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
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
    final storyCard = PatientStoryCard(
      imagePath: '',
      name: 'Марія, 54 роки · Відень, Австрія',
      metaLine: 'ALL-ON-6 · 2 ВІЗИТИ · ПОСТІЙНИЙ ПРОТЕЗ · #ЄРІШЕННЯ',
      quote: 'Я 8 років не фотографувалась у повну посмішку. Ховала рот '
          'на фото, уникала сміятись на людях. За два візити повернула те, '
          'що вважала назавжди втраченим.',
      detailsLabel: 'Детальніше',
      onDetailsTap: () {},
    );
    const beforeAfterCard = _BeforeAfterCard(
      name: 'Марія, 54 роки · Відень, Австрія',
      metaLine: 'ALL-ON-6 · 2 ВІЗИТИ · ПОСТІЙНИЙ ПРОТЕЗ · #ЄРІШЕННЯ',
      quote: 'Я 8 років не фотографувалась у повну посмішку. Ховала рот '
          'на фото, уникала сміятись на людях. За два візити повернула те, '
          'що вважала назавжди втраченим.',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'КЕЙСИ',
          title: 'Історії, що надихають',
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<Widget>(
          items: [storyCard, beforeAfterCard],
          itemWidth: 340,
          itemBuilder: (context, item) => item,
        ),
        const SizedBox(height: AppSpacing.lg),
        OutlinedButton(
          onPressed: () => context.go(AppRoutes.cases),
          child: const Text('БІЛЬШЕ ІСТОРІЙ'),
        ),
      ],
    );
  }
}

class _BeforeAfterCard extends StatelessWidget {
  const _BeforeAfterCard({
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
                child: Stack(
                  children: [
                    const _ImagePlaceholder(
                      icon: Icons.image_outlined,
                      height: 180,
                      borderRadius: BorderRadius.zero,
                    ),
                    const Positioned(
                      top: AppSpacing.sm,
                      left: AppSpacing.sm,
                      child: _TagChip(label: 'До'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    const _ImagePlaceholder(
                      icon: Icons.image_outlined,
                      height: 180,
                      borderRadius: BorderRadius.zero,
                    ),
                    const Positioned(
                      top: AppSpacing.sm,
                      left: AppSpacing.sm,
                      child: _TagChip(label: 'Після'),
                    ),
                  ],
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
                  metaLine,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.muted,
                        letterSpacing: 1.2,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _AlternativeOpinionSection extends StatelessWidget {
  const _AlternativeOpinionSection();

  @override
  Widget build(BuildContext context) {
    return _PhotoOverlayCard(
      eyebrow: 'АЛЬТЕРНАТИВНА ДУМКА',
      title: 'Вам вже озвучили план лікування — але є сумніви?',
      description: 'Надішліть висновок або КТ з іншої клініки — '
          'імплантолог Yeremchuk Dental розгляне вашу ситуацію і надасть '
          'незалежну оцінку. Безкоштовно.',
      imageIcon: Icons.medical_services_outlined,
      buttons: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(backgroundColor: AppColors.paper),
          child: const Text('ЗАВАНТАЖИТИ КТ'),
        ),
      ],
    );
  }
}

class _PhotoOverlayCard extends StatelessWidget {
  const _PhotoOverlayCard({
    required this.title,
    required this.description,
    required this.imageIcon,
    required this.buttons,
    this.eyebrow,
    this.checklist,
  });

  final String? eyebrow;
  final String title;
  final String description;
  final IconData imageIcon;
  final List<Widget> buttons;
  final List<String>? checklist;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Stack(
        children: [
          _ImagePlaceholder(
            icon: imageIcon,
            width: double.infinity,
            height: 420,
            iconSize: 72,
            borderRadius: BorderRadius.zero,
          ),
          Positioned(
            top: AppSpacing.lg,
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.paper.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (eyebrow != null) ...[
                    Text(
                      eyebrow!,
                      style:
                          Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.muted,
                                letterSpacing: 1.2,
                              ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      description,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.inkSoft,
                              ),
                    ),
                  ],
                  if (checklist != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    for (final item in checklist!) _ChecklistTile(text: item),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: buttons,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonSection extends StatelessWidget {
  const _ComparisonSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionEyebrowTitle(
          eyebrow: 'ПОРІВНЯННЯ',
          title: 'Імплантація vs зубні протези',
        ),
        SizedBox(height: AppSpacing.lg),
        _ComparisonTable(),
      ],
    );
  }
}

class _ComparisonTable extends StatelessWidget {
  const _ComparisonTable();

  static const _columns = ['Імплант', 'Знімний протез', 'Міст'];
  static const _rows = [
    (
      label: 'Термін служби',
      values: ['15–25+ років', '7–10 років', '3–5 років'],
    ),
    (
      label: 'Кістка',
      values: ['Зберігається', 'Втрачається', 'Розсмоктується'],
    ),
    (label: 'Комфорт', values: ['Як мій зуб', 'Прийнятно', 'Є обмеження']),
    (label: 'Естетика', values: ['Максимальна', 'Нормально', 'Задовільна']),
    (label: 'Фіксація', values: ['Незнімний', 'Знімний', 'Незнімний']),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line),
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FixedColumnWidth(140),
            1: FixedColumnWidth(160),
            2: FixedColumnWidth(160),
            3: FixedColumnWidth(160),
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(color: AppColors.paperDim),
              children: [
                _tableCell(context, 'Критерій', isHeader: true),
                for (final column in _columns)
                  _tableCell(context, column, isHeader: true),
              ],
            ),
            TableRow(
              children: [
                _tableCell(context, 'Вигляд'),
                for (var i = 0; i < _columns.length; i++)
                  const Padding(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    child: _ImagePlaceholder(
                      icon: Icons.image_outlined,
                      height: 90,
                    ),
                  ),
              ],
            ),
            for (final row in _rows)
              TableRow(
                children: [
                  _tableCell(context, row.label),
                  for (final value in row.values) _tableCell(context, value),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _tableCell(
    BuildContext context,
    String text, {
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Text(
        text,
        style: isHeader
            ? Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                )
            : Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                ),
      ),
    );
  }
}

class _DoctorConsultSection extends StatelessWidget {
  const _DoctorConsultSection();

  @override
  Widget build(BuildContext context) {
    return _PhotoOverlayCard(
      title: 'Не знаєте який метод підходить саме вам?',
      description: 'На консультації лікар пояснить варіанти з плюсами і '
          'мінусами кожного. Без тиску. Рішення за вами.',
      imageIcon: Icons.medical_services_outlined,
      buttons: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
        ),
      ],
    );
  }
}

class _ProcessSection extends StatelessWidget {
  const _ProcessSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionEyebrowTitle(
          eyebrow: 'ПРОЦЕС ІМПЛАНТАЦІЇ',
          title: 'Як проходить імплантація',
        ),
        SizedBox(height: AppSpacing.lg),
        NumberedStepCard(
          stepNumber: 1,
          title: 'Консультація та 3D-діагностика',
          description: 'Огляд, КТ, повна картина. Ви побачите свою '
              'майбутню посмішку на екрані монітора та отримаєте прогноз',
        ),
        SizedBox(height: AppSpacing.md),
        NumberedStepCard(
          stepNumber: 2,
          title: 'Цифрове планування',
          description: '3D-моделювання позиції імпланта. Виготовлення '
              'хірургічного шаблона.',
        ),
        SizedBox(height: AppSpacing.md),
        NumberedStepCard(
          stepNumber: 3,
          title: 'Встановлення імпланта',
          description: '15–30 хвилин під місцевою анестезією (або в '
              'седації — уві сні). Мінімальна травматичність завдяки '
              'шаблону. Ви нічого не відчуваєте.',
        ),
        SizedBox(height: AppSpacing.md),
        NumberedStepCard(
          stepNumber: 4,
          title: 'Приживлення',
          description: '3–6 місяців імплант зростається з кісткою '
              '(остеоінтеграція). Ви живете звичним життям.\nЗа потреби — '
              'тимчасова конструкція, щоб не ходити без зуба',
        ),
        SizedBox(height: AppSpacing.md),
        NumberedStepCard(
          stepNumber: 5,
          title: 'Постійна коронка',
          description: 'Цифрове сканування, виготовлення коронки '
              '(цирконій або кераміка), фіксація. Ваш новий зуб готовий. '
              'Не відрізниш від свого.',
        ),
        SizedBox(height: AppSpacing.lg),
        _ImagePlaceholder(
          icon: Icons.image_outlined,
          width: double.infinity,
          height: 220,
        ),
      ],
    );
  }
}

class _VideoFaqSection extends StatelessWidget {
  const _VideoFaqSection();

  @override
  Widget build(BuildContext context) {
    const card = _VideoQuestionCard(
      doctorName: 'Наталія Іванівна Гранда',
      doctorRole: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'ВІДПОВІДІ НА ПОШИРЕНІ ПИТАННЯ',
          title: 'Питання та відповіді від наших лікарів',
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<Widget>(
          items: const [card, card, card],
          itemWidth: 260,
          itemBuilder: (context, item) => item,
        ),
        const SizedBox(height: AppSpacing.lg),
        OutlinedButton(
          onPressed: () => context.go(AppRoutes.doctorFaq),
          child: const Text('БІЛЬШЕ ВІДЕО'),
        ),
      ],
    );
  }
}

class _VideoQuestionCard extends StatelessWidget {
  const _VideoQuestionCard({
    required this.doctorName,
    required this.doctorRole,
    required this.question,
  });

  final String doctorName;
  final String doctorRole;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              const _ImagePlaceholder(
                icon: Icons.person_outline,
                width: double.infinity,
                height: 200,
                borderRadius: BorderRadius.zero,
                iconSize: 56,
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.paper,
                      size: 26,
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
                      child:
                          Icon(Icons.person, color: AppColors.paper, size: 18),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            doctorRole,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
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
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
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

class _CostSection extends StatelessWidget {
  const _CostSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'СКІЛЬКИ КОШТУЄ ІМПЛАНТАЦІЯ',
          title: 'Що впливає на вартість?',
        ),
        const SizedBox(height: AppSpacing.lg),
        const _ChecklistTile(text: 'Обрана система та кількість імплантів'),
        const _ChecklistTile(text: 'Тип майбутньої коронки'),
        const _ChecklistTile(
          text: 'Необхідність кісткової пластики і складність клінічного '
              'випадку',
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Вартість імплантації залежить від клінічної ситуації, обраної '
          'імплантаційної системи та необхідного обсягу лікування.\nПісля '
          'консультації та діагностики ми складаємо індивідуальний план '
          'лікування з детальним кошторисом, щоб ви заздалегідь розуміли '
          'всі етапи та вартість майбутнього лікування.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: const [
            _HighlightNote(
              text: 'Є розтермінування – до 6 місяців від ПриватБанку без '
                  'переплат',
            ),
            _HighlightNote(text: 'Ціна фіксується до початку лікування'),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ОТРИМАТИ РОЗРАХУНОК'),
        ),
        const SizedBox(height: AppSpacing.lg),
        const _ImagePlaceholder(
          icon: Icons.image_outlined,
          width: double.infinity,
          height: 220,
        ),
      ],
    );
  }
}

class _HighlightNote extends StatelessWidget {
  const _HighlightNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        color: AppColors.paperDim,
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.teal, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DentalTourismSection extends StatelessWidget {
  const _DentalTourismSection();

  @override
  Widget build(BuildContext context) {
    return _PhotoOverlayCard(
      eyebrow: 'СТОМАТОЛОГІЧНИЙ ТУРИЗМ',
      title: 'Живете за кордоном? Приїжджаєте здалеку?',
      description: '',
      imageIcon: Icons.flight_outlined,
      checklist: const [
        'Онлайн-консультація до поїздки — знаєте план і вартість ще до '
            'того, як сісти в літак',
        'Допомагаємо з житлом і маршрутом — не займаєтесь організацією '
            'самі',
        'Плануємо лікування за мінімум поїздок — мінімум часу, максимум '
            'результату',
      ],
      buttons: [
        OutlinedButton(
          onPressed: () => context.go(AppRoutes.tourism),
          style: OutlinedButton.styleFrom(backgroundColor: AppColors.paper),
          child: const Text('ДІЗНАТИСЬ БІЛЬШЕ'),
        ),
      ],
    );
  }
}

class _CalculatorSection extends StatelessWidget {
  const _CalculatorSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ImagePlaceholder(
            icon: Icons.calculate_outlined,
            width: double.infinity,
            height: 220,
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionEyebrowTitle(
            eyebrow: 'КАЛЬКУЛЯТОР',
            title: 'Дізнайтесь вартість імплантації за 2 хвилини',
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Дайте відповідь на 4 питання — отримаєте орієнтовну вартість '
            'ще до консультації з лікарем',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(
            onPressed: () {},
            child: const Text('РОЗРАХУВАТИ'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(eyebrow: 'FAQ', title: 'Часті питання'),
        const SizedBox(height: AppSpacing.lg),
        FaqAccordion(
          items: const [
            FaqItem(
              question: 'Чи боляче лікувати зуби?',
              answer: 'Стоматологічна галузь у наш час пропонує '
                  'різноманітні методи знеболення. «Без болю» у сучасній '
                  'стоматології – небезпідставне формулювання, адже '
                  'доступною є метода лікування в седації. Це '
                  'контрольований медикаментозний сон, коли пацієнту '
                  'пропонують проведення усіх маніпуляцій уві сні під '
                  'контролем анестезіолога.',
            ),
            FaqItem(question: 'Скільки коштує консультація?', answer: ''),
            FaqItem(question: 'Чи можна лікувати зуби усі сні?', answer: ''),
            FaqItem(
              question: 'Що робити, якщо я боюсь стоматолога?',
              answer: '',
            ),
            FaqItem(question: 'Як записатись на прийом?', answer: ''),
          ],
        ),
      ],
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    const review = ReviewCard(
      authorName: 'Оксана М.',
      date: '21.07.2026 · Чернівці',
      rating: 4,
      text: 'Нарешті знайшла клініку, де пояснюють що роблять і чому. '
          'Ніякого тиску, ніяких несподіваних цін. Імплант поставили – і '
          'я забула, що він взагалі є.',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrowTitle(
          eyebrow: 'ВІДГУКИ',
          title: 'Що кажуть пацієнти',
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Text(
              '4.9',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'Google Maps · 200+ відгуків',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.muted,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<Widget>(
          items: const [review, review, review, review],
          itemWidth: 300,
          itemBuilder: (context, item) => item,
        ),
      ],
    );
  }
}
