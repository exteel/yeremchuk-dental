import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/faq_accordion.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Breadcrumbs(),
                  SizedBox(height: AppSpacing.xl),
                  _ArticleHeader(),
                  SizedBox(height: AppSpacing.xl),
                  _ArticleWithSidebar(),
                ],
              ),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Цікаві статті для вас',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ArrowCarousel<int>(
                    items: const [0, 1, 2],
                    itemWidth: 360,
                    itemBuilder: (context, index) => const _RelatedArticleCard(),
                  ),
                ],
              ),
            ),
            Container(
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
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.teal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  LeadFormSection(
                    title: 'Знайдемо рішення\nдля вашої ситуації теж',
                    subtitle: 'Запишіться на консультацію або напишіть нам. '
                        'Розберемось у ситуації, пояснимо варіанти, зафіксуємо вартість.',
                    services: const ['Дитяча стоматологія'],
                    submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                    onSubmit: (name, phone, service, date) {},
                    trailing: const _ImagePlaceholder(
                      width: 360,
                      height: 320,
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
                  (label: 'Імплантація', onTap: () {}),
                  (label: 'Ортодонтія', onTap: () {}),
                  (label: 'Вибілювання зубів', onTap: () {}),
                  (label: 'Профілактична стоматологія', onTap: () {}),
                  (label: 'Вініри естетичне протезування', onTap: () {}),
                  (label: 'Протезування', onTap: () {}),
                ],
                '': [
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
              phone: 'Запис за телефоном\n+38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: const [
                (icon: Icons.send, onTap: _noop),
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
}

void _noop() {}

class _Breadcrumbs extends StatelessWidget {
  const _Breadcrumbs();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.muted,
        );

    return Row(
      children: [
        Text('Головна', style: style),
        Text(' / ', style: style),
        Text('Блог', style: style),
        Text(' / ', style: style),
        Text('Імплантація зубів: повний гід', style: style),
      ],
    );
  }
}

class _ArticleHeader extends StatelessWidget {
  const _ArticleHeader();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final tagRow = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                'Імплантація',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.tealDark,
                    ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              '21.07.2026',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
          ],
        );

        final title = Text(
          'Імплантація зубів: повний гід',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        );

        final author = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.cardBg,
              child: Icon(Icons.person, color: AppColors.muted),
            ),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Автор статті:',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
                Text(
                  'Наталія Іванівна Гранда',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Лікар стоматолог',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
              ],
            ),
          ],
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tagRow,
                    const SizedBox(height: AppSpacing.md),
                    title,
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              author,
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tagRow,
            const SizedBox(height: AppSpacing.md),
            title,
            const SizedBox(height: AppSpacing.lg),
            author,
          ],
        );
      },
    );
  }
}

class _ArticleWithSidebar extends StatelessWidget {
  const _ArticleWithSidebar();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        if (isWide) {
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 280, child: _TableOfContents()),
              SizedBox(width: AppSpacing.xl),
              Expanded(child: _ArticleBody()),
            ],
          );
        }

        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TableOfContents(),
            SizedBox(height: AppSpacing.xl),
            _ArticleBody(),
          ],
        );
      },
    );
  }
}

class _TableOfContents extends StatelessWidget {
  const _TableOfContents();

  static const _items = [
    'Імплантація зубів: повний гід – як проходить, чи боляче та скільки коштує',
    'Що таке імплантація зубів',
    'Коли потрібна імплантація',
    'Як проходить імплантація зубів',
    'Чи боляче ставити імплант',
    'Скільки служать імпланти',
    'Від чого залежить вартість імплантації',
    'Імплант чи міст – коротке порівняння',
    'Висновок',
    'FAQ: поширені запитання',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Зміст:',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        for (var i = 0; i < _items.length; i++)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppSpacing.xs),
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: i == 0 ? AppColors.paper : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSpacing.sm),
            ),
            child: Text(
              _items[i],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: i == 0 ? AppColors.ink : AppColors.inkSoft,
                    fontWeight: i == 0 ? FontWeight.w600 : FontWeight.normal,
                  ),
            ),
          ),
      ],
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _ImagePlaceholder(height: 420),
        const SizedBox(height: AppSpacing.xl),
        _Heading(
          'Імплантація зубів: повний гід – як проходить, чи боляче та скільки коштує',
        ),
        const SizedBox(height: AppSpacing.md),
        _BoldLine('Коротко про головне:'),
        const SizedBox(height: AppSpacing.sm),
        const _BulletList([
          'Імплантація зубів – це найбільш сучасний спосіб відновити '
              'втрачений природний корінь зуба.',
          'Процедура проходить безболісно завдяки сучасним методам знеболення.',
          'У разі правильного догляду термін служби імплантів не обмежений часом.',
          'Кожна ситуація має своє рішення, яке стоматологічний фахівець '
              'запропонує вам за результатами детального обстеження.',
        ]),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Втрата навіть одного зуба – це не лише естетичне питання, а й '
          'виклик для здоров\'я всієї щелепи. Сучасна стоматологія пропонує '
          'надійний вихід, який дозволяє забути про дискомфорт і повернути '
          'впевнену посмішку. Нижче детально розберемо, що таке імплантація '
          'зубів та яких результатів варто очікувати від цієї процедури. '
          'Наша мета – надати вичерпну інформацію, щоб ви могли впевнено '
          'наважитись на дентальну імплантацію, адже на кожен складний '
          'випадок завжди є рішення. Такий підхід допомагає зрозуміти, як '
          'проходить імплантація та чому вона стає надійним варіантом для '
          'відновлення усмішки.',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Що таке імплантація зубів'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Якщо говорити просто, то зубний імплант – це невелика титанова '
          'опора, яка виконує роль штучного кореня зуба. Вона встановлюється '
          'в кістку щелепи та з часом зростається з нею, створюючи міцний '
          'фундамент для майбутньої зубної коронки.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'На відміну від звичайних зубних протезів, така конструкція не '
          'просто закриває «дірку» в зубному ряду, а повноцінно передає '
          'жувальне навантаження на кістку. Це вкрай важливо, оскільки без '
          'навантаження кісткова тканина починає поступово зменшуватися в '
          'об\'ємі. Отже, імплантація зубів стає інвестицією у збереження '
          'здоров\'я сусідніх зубів та контурів обличчя.',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Коли потрібна імплантація'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Багато людей вважають, що відновлювати втрачені зуби потрібно '
          'лише тоді, коли це заважає жувати або псує вигляд усмішки під час '
          'розмови. Проте фахівці радять розглядати цей варіант у значно '
          'ширшому спектрі ситуацій.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Найчастіше імплант зуба стає найкращим рішенням у таких випадках:',
        ),
        const SizedBox(height: AppSpacing.sm),
        const _BulletList([
          'відсутність одного зуба, коли не хочеться обпилювати сусідні '
              'здорові зуби під мостоподібний протез;',
          'втрата декількох одиниць поспіль (тоді імпланти стають опорою '
              'для мостоподібного протеза);',
          'втрата цілісності зубного ряду на обох щелепах або одній із них;',
          'неможливість чи небажання використовувати знімні протези через '
              'їхню рухливість.',
        ]),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Кожна з цих ситуацій потребує індивідуального підходу, проте '
          'сучасні стоматологічні протоколи дають змогу знайти ефективне '
          'рішення для кожного пацієнта.',
        ),
        const SizedBox(height: AppSpacing.xl),
        const _ImagePlaceholder(height: 420),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Як проходить імплантація зубів?'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Процес повернення усмішки зазвичай розділяють на кілька логічних '
          'етапів. Це допомагає пацієнту розуміти, як ставлять імпланти, і '
          'почуватися впевнено під час лікування. До того ж, детальна '
          'інформація про те, які є етапи імплантації, допомагає зняти '
          'зайву тривожність перед першим візитом до стоматологічного '
          'хірурга.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Загалом процес того, як проходить імплантація зубів, виглядає так:',
        ),
        const SizedBox(height: AppSpacing.sm),
        const _NumberedList([
          (
            number: 1,
            boldLead: 'Діагностика та планування.',
            rest: ' Лікар вивчає 3D-знімок щелепи, щоб оцінити стан кістки.',
          ),
          (
            number: 2,
            boldLead: 'Підготовчий етап.',
            rest: ' У разі виявлення карієсу чи запалення ясен спершу '
                'усувають ці проблеми, щоб створити здоровий фундамент для '
                'майбутньої усмішки.',
          ),
          (
            number: 3,
            boldLead: 'Встановлення.',
            rest: ' Це невелика операція, під час якої штучний корінь '
                'розміщують у щелепі.',
          ),
          (
            number: 4,
            boldLead: 'Приживлення.',
            rest: ' Найважливіший період, що триває від 3 до 6 місяців, '
                'поки титан зростається зі щелепою.',
          ),
          (
            number: 5,
            boldLead: 'Протезування.',
            rest: ' Фінальний крок – встановлення постійної зубної коронки, '
                'яка ідентична природним зубам.',
          ),
        ]),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Така послідовність дій гарантує передбачуваний результат і '
          'високий відсоток успіху процедури. Ознайомитися з варіантами '
          'лікування та детальніше дізнатися про імплантацію зубів можна на '
          'сторінці послуги.',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Чи боляче ставити імплант'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Страх перед болем – це природна реакція, проте в сучасній '
          'стоматології вона не має під собою реальних підстав. Багатьох '
          'цікавить, чи боляче ставити імплант, і відповідь фахівців '
          'зазвичай заспокоює. Більш детально про відчуття та види '
          'анестезії ми розповідали у статті «Чи боляче ставити імплант».',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Під час маніпуляції використовується ефективна місцева '
          'анестезія, яка повністю блокує чутливість у зоні стоматологічної '
          'маніпуляції. Для тих, хто відчуває сильний стрес, є седація '
          '(медикаментозний сон). У такому стані пацієнт відпочиває, а '
          'лікар-стоматолог може спокійно та точно виконати свою роботу. '
          'Після завершення дії анестезії може спостерігатися незначний '
          'больовий дискомфорт у зоні імплантації зуба, але він легко '
          'усувається звичайними знеболювальними засобами.',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Скільки служать імпланти'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Одне з найпоширеніших питань стосується довговічності дентальної '
          'конструкції. Важливо розуміти, що сам титановий гвинт не '
          'схильний до карієсу чи руйнування, тому теоретично він може '
          'служити вам усе життя.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'На те, скільки служить імплант, впливають кілька ключових факторів:',
        ),
        const SizedBox(height: AppSpacing.sm),
        const _BulletList([
          'якість системи (світові бренди надають довічну гарантію на свої '
              'вироби);',
          'стан загального здоров\'я організму та відсутність шкідливих '
              'звичок;',
          'рівень щоденної гігієни (зубні імпланти потребують чищення так '
              'само ретельно, як і власні зуби);',
          'регулярні професійні огляди у стоматолога двічі на рік.',
        ]),
        const SizedBox(height: AppSpacing.md),
        _Paragraph.rich(
          context,
          const [
            _TextSegment(
              'Якщо дотримуватися цих простих правил, то питання про те, як '
              'довго служить імплант, отримає відповідь – десятиліттями. '
              'Більш детально про те, ',
            ),
            _TextSegment('скільки служить імплант', underline: true),
            _TextSegment(
              ', можна прочитати в нашому спеціальному матеріалі.',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Від чого залежить вартість імплантації'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Часто пацієнти дивуються, чому на запит, яка на імплантацію '
          'зубів ціна вони бачать цифри, що суттєво відрізняються. '
          'Насправді вартість імплантації – це комплексний показник, який '
          'складається з багатьох компонентів.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph('Основними чинниками, що впливають на фінальний чек, є:'),
        const SizedBox(height: AppSpacing.sm),
        const _BulletList([
          'Виробник. Є системи преміум-класу та більш бюджетні варіанти.',
          'Стан кісткової тканини. Якщо зуба не було довгий час, може '
              'знадобитися нарощування кістки.',
          'Матеріал зубної коронки. Кераміка чи діоксид цирконію мають '
              'максимально природній вигляд.',
          'Складність випадку. Кількість етапів діагностики та '
              'використання навігаційних шаблонів також мають значення.',
        ]),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Ми віримо, що фінансова прозорість допомагає побудувати довіру, '
          'тому завжди радимо обговорювати повний план стоматологічного '
          'лікування заздалегідь. Більш детальна інформація в статті '
          '"Скільки коштує імплант зуба"',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Імплант чи міст – коротке порівняння'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Вибираючи між класичним протезуванням і сучасними методами, '
          'важливо зважити всі «за» і «проти». Кожен метод має свої '
          'особливості, які проявляються з роками експлуатації.',
        ),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Питання що краще імплант чи міст виникає досить часто. '
          'Традиційний мостоподібний зубний протез потребує обточування '
          'сусідніх зубів, які беруть на себе все навантаження. Натомість '
          'зубний імплант є автономним: він не руйнує сусідні зуби. Хоча '
          'початкові витрати можуть здатися вищими, порівнюючи – '
          'імплантація чи протезування мостами, перший варіант часто '
          'виявляється більш вигідним, оскільки не потребує заміни кожні '
          '7–10 років.',
        ),
        const SizedBox(height: AppSpacing.xl),
        const _ImagePlaceholder(height: 420),
        const SizedBox(height: AppSpacing.xl),
        _Heading('Висновок'),
        const SizedBox(height: AppSpacing.md),
        const _Paragraph(
          'Імплантація зубів – це не просто медична процедура, а '
          'можливість знову відчувати смак життя та сміятися без сорому. '
          'Це рішення підходить майже всім, хто втратив зуби через травми '
          'чи хвороби. Головне – пам\'ятати, що сучасні стоматологіні '
          'технології дають змогу зробити шлях до ідеальної усмішки '
          'комфортним. Якщо ви обираєте між варіантами – імплант чи міст, '
          'пам\'ятайте: на кожен випадок є рішення, і знайти його можна під '
          'час консультації із фахівцем.',
        ),
        const SizedBox(height: AppSpacing.xl),
        _Heading('FAQ: поширені запитання'),
        const SizedBox(height: AppSpacing.md),
        const FaqAccordion(
          items: [
            FaqItem(
              question: 'Чи боляче ставити імплант зуба?',
              answer: 'Ні, процедура проводиться під анестезією, яка '
                  'повністю блокує біль. Під час встановлення зубного '
                  'імпланта пацієнт може відчувати лише легкий тиск.',
            ),
            FaqItem(
              question: 'Скільки часу займає імплантація зубів?',
              answer: '',
            ),
            FaqItem(
              question: 'Скільки служить зубний імплант?',
              answer: '',
            ),
            FaqItem(
              question: 'Скільки коштує імплантація зубів?',
              answer: '',
            ),
            FaqItem(
              question: 'Чи можна ставити імплант одразу після видалення зуба?',
              answer: '',
            ),
          ],
        ),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _BoldLine extends StatelessWidget {
  const _BoldLine(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);

  final String text;

  static Widget rich(BuildContext context, List<_TextSegment> segments) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.inkSoft,
        );
    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          for (final segment in segments)
            TextSpan(
              text: segment.text,
              style: segment.underline
                  ? baseStyle?.copyWith(
                      color: AppColors.teal,
                      decoration: TextDecoration.underline,
                    )
                  : null,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.inkSoft,
          ),
    );
  }
}

class _TextSegment {
  const _TextSegment(this.text, {this.underline = false});

  final String text;
  final bool underline;
}

class _BulletList extends StatelessWidget {
  const _BulletList(this.items);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•  ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkSoft,
                      ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.inkSoft,
                        ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _NumberedList extends StatelessWidget {
  const _NumberedList(this.items);

  final List<({int number, String boldLead, String rest})> items;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.inkSoft,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.number}.  ', style: baseStyle),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: baseStyle,
                      children: [
                        TextSpan(
                          text: item.boldLead,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.ink,
                          ),
                        ),
                        TextSpan(text: item.rest),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Container(
        height: height,
        width: width,
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
}

class _RelatedArticleCard extends StatelessWidget {
  const _RelatedArticleCard();

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
          const _ImagePlaceholder(height: 220),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                        'Імплантація',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.tealDark,
                            ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '21.07.2026',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Імплантація зубів: повний гід',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Імплантація при нестачі кістки: що робити, якщо '
                  '«кістки не вистачає» Ще декілька років тому '
                  'стоматологічні пацієнти, що мали бажання відновити…',
                  maxLines: 3,
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
                      'Детальніше',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
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
