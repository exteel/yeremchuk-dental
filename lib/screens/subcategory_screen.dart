import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/faq_accordion.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/numbered_step_card.dart';
import 'package:yeremchuk_dental/widgets/patient_story_card.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';
import 'package:yeremchuk_dental/widgets/stat_badge.dart';

typedef _TitleDescription = ({String title, String description});

const _forWhomCards = <({String number, String title, String description})>[
  (
    number: '01',
    title: 'Втратили більшість або всі зуби',
    description:
        'Повне відновлення зубного ряду на верхній або нижній щелепі — або одразу на обох.',
  ),
  (
    number: '02',
    title: 'Знімний протез не тримається',
    description:
        'Балансує, натирає, заважає їсти і говорити. All-on-4 — незнімна конструкція, яка не рухається.',
  ),
  (
    number: '03',
    title: 'Відмовили через атрофію кістки',
    description:
        'Імпланти All-on-4 встановлюються під кутом — дозволяє уникнути кісткової пластики навіть при значній атрофії.',
  ),
  (
    number: '04',
    title: 'Хочете вирішити все за один приїзд',
    description:
        'Актуально для пацієнтів з-за кордону. Протез встановлюється в день операції.',
  ),
];

const _advantages = <_TitleDescription>[
  (
    title: 'Виходите з клініки з зубами',
    description:
        'Тимчасовий протез встановлюється в день операції. Не потрібно чекати місяці без зубів.',
  ),
  (
    title: 'Не знімається — як свої зуби',
    description:
        'Фіксована конструкція не рухається, не натирає. Їсте, говорите, смієтесь вільно.',
  ),
  (
    title: 'Зупиняє атрофію кістки',
    description:
        'Імпланти навантажують кістку — вона не розсмоктується. Обличчя зберігає природні контури.',
  ),
  (
    title: 'Мінімум імплантів — максимум результату',
    description:
        '4 або 6 імплантів замість 10–14. Менше операційного навантаження, коротший термін.',
  ),
  (
    title: 'Підходить при атрофії кістки',
    description:
        'Імпланти навантажують кістку — вона не розсмоктується. Обличчя зберігає природні контури.',
  ),
  (
    title: 'Пожиттєва гарантія на імпланти',
    description:
        'Офіційна гарантія виробника + гарантія клініки. Умови фіксуємо письмово до початку.',
  ),
];

const _stepsMobile = <_TitleDescription>[
  (
    title: 'Консультація та 3D-діагностика',
    description:
        'Огляд, КТ, повна картина. Ви побачите свою майбутню посмішку на екрані монітора та отримаєте прогноз.',
  ),
  (
    title: 'Цифрове планування',
    description:
        '3D-моделювання позиції імпланта. Виготовлення хірургічного шаблона.',
  ),
  (
    title: 'Встановлення імпланта',
    description:
        '15–30 хвилин під місцевою анестезією (або в седації — уві сні). Мінімальна травматичність завдяки шаблону. Ви нічого не відчуваєте.',
  ),
  (
    title: 'Приживлення',
    description:
        '3–6 місяців імплант зростається з кісткою (остеоінтеграція). Ви живете звичним життям.',
  ),
  (
    title: 'Постійна коронка',
    description:
        'Цифрове сканування, виготовлення коронки (цирконій або кераміка), фіксація. Ваш новий зуб готовий. Не відрізниш від свого.',
  ),
];

const _stepsDesktop = <_TitleDescription>[
  (
    title: 'Консультація та КТ',
    description:
        'Огляд, тривимірний знімок щелепи. Визначаємо чи підходить All-on-4 або потрібен All-on-6. Консультація — безкоштовно.',
  ),
  (
    title: 'Цифрове планування',
    description:
        '3D-моделювання позиції імплантів. Виготовлення хірургічного шаблону для точного встановлення.',
  ),
  (
    title: 'Встановлення імплантів',
    description:
        '4 або 6 імплантів під місцевою анестезією або в седації. Мінімально інвазивно завдяки шаблону.',
  ),
  (
    title: 'Тимчасовий протез в той же день',
    description:
        'Виходите з клініки з зубами. Тимчасова конструкція на весь період приживлення — 3–6 місяців.',
  ),
  (
    title: 'Постійний протез',
    description:
        'Після приживлення — постійний протез із цирконію або кераміки. Виглядає і відчувається як свої зуби.',
  ),
];

const _tourismPoints = <String>[
  'Онлайн-консультація до поїздки — знаєте план і вартість ще до того, як сісти в літак',
  'Допомагаємо з житлом і маршрутом — не займаєтесь організацією самі',
  'Плануємо лікування за мінімум поїздок — мінімум часу, максимум результату',
];

const _reviewAuthor = 'Оксана М.';
const _reviewDate = '21.07.2026';
const _reviewText =
    'Нарешті знайшла клініку, де пояснюють що роблять і чому. Ніякого тиску, ніяких несподіваних цін. Імплант поставили — і я забула, що він взагалі є.';

const _storyMeta = 'All-on-6 · 2 візити · Постійний протез · #єрішення';
const _storyName = 'Марія, 54 роки · Відень, Австрія';
const _storyQuote =
    'Я 8 років не фотографувалась у повну посмішку. Ховала рот на фото, уникала сміятись на людях. За два візити повернула те, що вважала назавжди втраченим.';

const _faqAnswer =
    'Стоматологічна галузь у наш час пропонує різноманітні методи знеболення. «Без болю» у сучасній стоматології – небезпідставне формулювання, адже доступною є метода лікування в седації. Це контрольований медикаментозний сон, коли пацієнту пропонують проведення усіх маніпуляцій уві сні під контролем анестезіолога.';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key});

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
          (label: 'Про нас', onTap: () {}),
          (label: 'Ціни', onTap: () {}),
          (label: 'Стоматологічний туризм', onTap: () {}),
          (label: 'Для пацієнтів', onTap: () {}),
          (label: 'Контакти', onTap: () {}),
        ],
        onMenuTap: () {},
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 900;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildHero(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildForWhom(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: _buildMethod(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildAdvantages(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: _buildProcess(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildCalculator(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: _buildCases(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildTourism(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: _buildFaqVideos(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: _buildAlternativeOpinion(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildFaqAccordion(context, isDesktop),
                ),
                _section(
                  color: AppColors.paper,
                  isDesktop: isDesktop,
                  child: _buildReviews(context, isDesktop),
                ),
                _section(
                  color: AppColors.paperDim,
                  isDesktop: isDesktop,
                  child: LeadFormSection(
                    title: 'Знайдемо рішення\nдля вашої ситуації теж',
                    subtitle:
                        'Запишіться на консультацію або напишіть нам. Розберемось у ситуації, пояснимо варіанти, зафіксуємо вартість.',
                    services: const ['Дитяча стоматологія'],
                    submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                    onSubmit: (name, phone, service, date) {},
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
                      (label: 'Про нас', onTap: () {}),
                      (label: 'Ціни', onTap: () {}),
                      (label: 'Стоматологічний туризм', onTap: () {}),
                      (label: 'Новини', onTap: () {}),
                      (label: 'Питання та відповіді', onTap: () {}),
                      (label: 'Контакти', onTap: () {}),
                    ],
                  },
                  phone: 'Запис за телефоном +38(050) 310-98-04',
                  email: 'royal.med.if@gmail.com',
                  socialLinks: [
                    (icon: Icons.send, onTap: () {}),
                    (icon: Icons.camera_alt, onTap: () {}),
                    (icon: Icons.chat, onTap: () {}),
                    (icon: Icons.support_agent, onTap: () {}),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _section({
    required Color color,
    required bool isDesktop,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxl : AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, bool isDesktop) {
    final breadcrumb = Wrap(
      children: const [
        Text('Головна', style: TextStyle(color: AppColors.muted)),
        Text(' / ', style: TextStyle(color: AppColors.muted)),
        Text('Імплантація', style: TextStyle(color: AppColors.muted)),
        Text(' / ', style: TextStyle(color: AppColors.muted)),
        Text('All-on-4', style: TextStyle(color: AppColors.muted)),
        Text(' / ', style: TextStyle(color: AppColors.muted)),
        Text('All-on-6', style: TextStyle(color: AppColors.muted)),
      ],
    );

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        breadcrumb,
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Повне відновлення зубів All-on-4, All-on-6 в Івано-Франківську',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'All-on-4 — це метод повного відновлення зубного ряду, при якому весь протез фіксується лише на 4 імплантах. Підходить навіть при значній атрофії кістки — без кісткової пластики.',
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

    final visual = _HeroVisual(isDesktop: isDesktop);

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: textColumn),
          const SizedBox(width: AppSpacing.xl),
          Expanded(flex: 5, child: visual),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textColumn,
        const SizedBox(height: AppSpacing.xl),
        visual,
      ],
    );
  }

  Widget _buildForWhom(BuildContext context, bool isDesktop) {
    final cards = _forWhomCards
        .map(
          (card) => _NumberedInfoCard(
            number: card.number,
            title: card.title,
            description: card.description,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ДЛЯ КОГО'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'All-on-4 / All-on-6 — рішення для вас, якщо:',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (isDesktop)
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < cards.length; i++) ...[
                Expanded(child: cards[i]),
                if (i < cards.length - 1)
                  const SizedBox(width: AppSpacing.md),
              ],
            ],
          )
        else
          ArrowCarousel<Widget>(
            items: cards,
            itemWidth: 280,
            itemBuilder: (context, item) => item,
          ),
      ],
    );
  }

  Widget _buildMethod(BuildContext context, bool isDesktop) {
    final cards = [
      const _MethodCard(
        title: 'All-on-4',
        description:
            'Чотири імпланти — два прямі спереду і два під кутом ззаду. Кут встановлення дозволяє використати наявну кістку без нарощування. На імпланти фіксується незнімний протез із повним зубним рядом.',
        note: 'Підходить для більшості пацієнтів із повною втратою зубів.',
      ),
      const _MethodCard(
        title: 'All-on-6',
        description:
            "Шість імплантів — більша площа опори, вища стабільність конструкції. Рекомендується при більшому навантаженні або при достатньому об'ємі кістки.",
        note: 'Підходить для більшості пацієнтів із повною втратою зубів.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ПРО МЕТОД'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Що таке All-on-4 і All-on-6?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (isDesktop)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: cards[1]),
            ],
          )
        else
          Column(
            children: [
              cards[0],
              const SizedBox(height: AppSpacing.md),
              cards[1],
            ],
          ),
        const SizedBox(height: AppSpacing.lg),
        _DecisionBanner(isDesktop: isDesktop),
      ],
    );
  }

  Widget _buildAdvantages(BuildContext context, bool isDesktop) {
    final checklist = Column(
      children: [
        for (var i = 0; i < _advantages.length; i++) ...[
          _ChecklistCard(
            title: _advantages[i].title,
            description: _advantages[i].description,
          ),
          if (i < _advantages.length - 1)
            const SizedBox(height: AppSpacing.md),
        ],
      ],
    );

    final image = _ImagePlaceholder(
      aspectRatio: isDesktop ? 4 / 5 : 16 / 10,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ПЕРЕВАГИ'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Чому All-on-4, а не знімний протез?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (isDesktop)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: image),
              const SizedBox(width: AppSpacing.lg),
              Expanded(child: checklist),
            ],
          )
        else
          Column(
            children: [
              image,
              const SizedBox(height: AppSpacing.lg),
              checklist,
            ],
          ),
      ],
    );
  }

  Widget _buildProcess(BuildContext context, bool isDesktop) {
    final steps = isDesktop ? _stepsDesktop : _stepsMobile;
    final stepCards = [
      for (var i = 0; i < steps.length; i++)
        _StepWithLabel(
          stepNumber: i + 1,
          title: steps[i].title,
          description: steps[i].description,
        ),
    ];
    final trailingImage = const _ImagePlaceholder(aspectRatio: 4 / 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ПРОЦЕС ІМПЛАНТАЦІЇ'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Як проходить All-on-4/All-on-6 в Yeremchuk Dental',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (isDesktop)
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: stepCards[0]),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: stepCards[1]),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: stepCards[2]),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: stepCards[3]),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: stepCards[4]),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: trailingImage),
                ],
              ),
            ],
          )
        else
          Column(
            children: [
              for (final step in stepCards) ...[
                step,
                const SizedBox(height: AppSpacing.md),
              ],
              trailingImage,
            ],
          ),
      ],
    );
  }

  Widget _buildCalculator(BuildContext context, bool isDesktop) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Eyebrow('КАЛЬКУЛЯТОР'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Дізнайтесь вартість імплантації All-on-4/All-on-6 за 2 хвилини',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Дайте відповідь на 4 питання — отримаєте орієнтовну вартість ще до консультації з лікарем',
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
    );

    final image = _ImagePlaceholder(
      aspectRatio: isDesktop ? 4 / 3 : 16 / 10,
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.line),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: image),
              ],
            )
          : Column(
              children: [
                image,
                const SizedBox(height: AppSpacing.lg),
                textColumn,
              ],
            ),
    );
  }

  Widget _buildCases(BuildContext context, bool isDesktop) {
    final storyCard = PatientStoryCard(
      imagePath: '',
      name: _storyName,
      metaLine: _storyMeta,
      quote: _storyQuote,
      detailsLabel: 'Детальніше',
      onDetailsTap: () {},
    );
    final beforeAfterCard = const _BeforeAfterStoryCard(
      metaLine: _storyMeta,
      name: _storyName,
      quote: _storyQuote,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('КЕЙСИ'),
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
          items: [storyCard, beforeAfterCard],
          itemWidth: isDesktop ? 560 : 300,
          showDots: false,
          itemBuilder: (context, item) => item,
        ),
        const SizedBox(height: AppSpacing.lg),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            isDesktop ? 'ПОДИВИТИСЬ ВСІ ІСТОРІЇ' : 'БІЛЬШЕ ІСТОРІЙ',
          ),
        ),
      ],
    );
  }

  Widget _buildTourism(BuildContext context, bool isDesktop) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: _ImagePlaceholder(
            aspectRatio: isDesktop ? 16 / 7 : 4 / 5,
            color: AppColors.navySoft,
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: isDesktop ? 0 : null,
          width: isDesktop ? 460 : double.infinity,
          child: Container(
            margin: const EdgeInsets.all(AppSpacing.lg),
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.navy.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'СТОМАТОЛОГІЧНИЙ ТУРИЗМ',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white70,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Живете за кордоном?\nПриїжджаєте здалеку?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppSpacing.md),
                for (final point in _tourismPoints)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.teal,
                          size: 18,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            point,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white70,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: AppSpacing.sm),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ДІЗНАТИСЬ БІЛЬШЕ'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFaqVideos(BuildContext context, bool isDesktop) {
    final cards = List.generate(
      3,
      (index) => const _DoctorVideoCard(
        doctorName: 'Наталія Іванівна Гранда',
        doctorRole: 'Лікар стоматолог',
        question: 'Чи боляче ставити імплант?',
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ВІДПОВІДІ НА ПОШИРЕНІ ПИТАННЯ'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Питання та відповіді від наших лікарів',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<Widget>(
          items: cards,
          itemWidth: 280,
          showDots: false,
          itemBuilder: (context, item) => item,
        ),
        const SizedBox(height: AppSpacing.lg),
        OutlinedButton(
          onPressed: () {},
          child: const Text('БІЛЬШЕ ВІДЕО'),
        ),
      ],
    );
  }

  Widget _buildAlternativeOpinion(BuildContext context, bool isDesktop) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'АЛЬТЕРНАТИВНА ДУМКА',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Вам вже озвучили план лікування — але є сумніви?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          "Надішліть висновок або КТ з іншої клініки — імплантолог Yeremchuk Dental розгляне вашу ситуацію і надасть незалежну оцінку. Безкоштовно.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
              child: const Text('ЗАВАНТАЖИТИ КТ'),
            ),
          ],
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          child: textColumn,
        ),
        const SizedBox(height: AppSpacing.lg),
        _ImagePlaceholder(aspectRatio: isDesktop ? 16 / 7 : 4 / 3),
      ],
    );
  }

  Widget _buildFaqAccordion(BuildContext context, bool isDesktop) {
    final items = isDesktop
        ? const [
            FaqItem(
              question: 'Чи боляче робити All-on-4?',
              answer: _faqAnswer,
            ),
            FaqItem(
              question:
                  'Скільки часу займає від консультації до постійного протеза?',
              answer: '',
            ),
            FaqItem(
              question: 'Як доглядати за протезом All-on-4?',
              answer: '',
            ),
            FaqItem(
              question: 'Скільки служить протез All-on-4?',
              answer: '',
            ),
            FaqItem(
              question: 'Чи можна їсти одразу після операції?',
              answer: '',
            ),
          ]
        : const [
            FaqItem(
              question: 'Чи боляче лікувати зуби?',
              answer: _faqAnswer,
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
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('FAQ'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Часті питання',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        FaqAccordion(items: items),
      ],
    );
  }

  Widget _buildReviews(BuildContext context, bool isDesktop) {
    final cards = List.generate(
      4,
      (index) => const ReviewCard(
        authorName: _reviewAuthor,
        date: _reviewDate,
        rating: 4,
        text: _reviewText,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('ВІДГУКИ'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Що кажуть пацієнти',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Text(
              '4.9',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.ink,
                  ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.star_rounded, color: AppColors.amber),
            const Icon(Icons.star_rounded, color: AppColors.amber),
            const Icon(Icons.star_rounded, color: AppColors.amber),
            const Icon(Icons.star_rounded, color: AppColors.amber),
            const Icon(Icons.star_rounded, color: AppColors.amber),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Google Maps · 200+ відгуків',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<Widget>(
          items: cards,
          itemWidth: 300,
          showDots: false,
          itemBuilder: (context, item) => item,
        ),
      ],
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.muted,
            letterSpacing: 1.2,
          ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.aspectRatio, this.color});

  final double aspectRatio;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          color: color ?? AppColors.cardBg,
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported,
            color: AppColors.muted,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _ImagePlaceholder(aspectRatio: isDesktop ? 4 / 3 : 3 / 4),
        Positioned(
          left: AppSpacing.md,
          top: AppSpacing.md,
          child: const StatBadge(
            value: '5-7',
            label: 'днів від консультації\nдо нових зубів',
          ),
        ),
        Positioned(
          right: isDesktop ? -AppSpacing.lg : AppSpacing.md,
          top: isDesktop ? 100 : null,
          bottom: isDesktop ? null : 100,
          child: const StatBadge(
            value: '4-6',
            label: 'імплантів замість\nцілого зубного ряду',
          ),
        ),
        Positioned(
          left: isDesktop ? 40 : AppSpacing.md,
          bottom: AppSpacing.md,
          child: StatBadge(
            value: '98%',
            label: isDesktop
                ? 'приживлення імплантів\nза шаблоном'
                : 'Приживлення\nімплантів',
          ),
        ),
      ],
    );
  }
}

class _NumberedInfoCard extends StatelessWidget {
  const _NumberedInfoCard({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Container(
        color: AppColors.paperDim,
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Stack(
          children: [
            Positioned(
              top: -16,
              left: -8,
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: AppColors.muted.withValues(alpha: 0.25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    description,
                    style: const TextStyle(color: AppColors.inkSoft),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({
    required this.title,
    required this.description,
    required this.note,
  });

  final String title;
  final String description;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ImagePlaceholder(aspectRatio: 16 / 9),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                const SizedBox(height: AppSpacing.sm),
                Text(
                  note,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.muted,
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

class _DecisionBanner extends StatelessWidget {
  const _DecisionBanner({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Яке рішення підходить — All-on-4 чи All-on-6?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Визначає лікар після КТ-діагностики. Покажемо варіанти і пояснимо різницю.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ'),
        ),
      ],
    );

    final image = _ImagePlaceholder(aspectRatio: isDesktop ? 16 / 9 : 4 / 3);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: image),
              ],
            )
          : Column(
              children: [
                textColumn,
                const SizedBox(height: AppSpacing.lg),
                image,
              ],
            ),
    );
  }
}

class _ChecklistCard extends StatelessWidget {
  const _ChecklistCard({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.line),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.teal),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  description,
                  style: const TextStyle(color: AppColors.inkSoft),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepWithLabel extends StatelessWidget {
  const _StepWithLabel({
    required this.stepNumber,
    required this.title,
    required this.description,
  });

  final int stepNumber;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'крок $stepNumber',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.muted,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        NumberedStepCard(
          stepNumber: stepNumber,
          title: title,
          description: description,
        ),
      ],
    );
  }
}

class _BeforeAfterStoryCard extends StatelessWidget {
  const _BeforeAfterStoryCard({
    required this.metaLine,
    required this.name,
    required this.quote,
  });

  final String metaLine;
  final String name;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Expanded(
                child: _LabeledImagePlaceholder(label: 'До'),
              ),
              Expanded(
                child: _LabeledImagePlaceholder(label: 'Після'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
}

class _LabeledImagePlaceholder extends StatelessWidget {
  const _LabeledImagePlaceholder({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
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
          left: AppSpacing.sm,
          top: AppSpacing.sm,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
            ),
            child: Text(
              label,
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

class _DoctorVideoCard extends StatelessWidget {
  const _DoctorVideoCard({
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
              const _ImagePlaceholder(aspectRatio: 1),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.cardBg,
                      child: Icon(
                        Icons.person,
                        size: 18,
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            doctorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
