import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';

class DoctorFaqScreen extends StatelessWidget {
  const DoctorFaqScreen({super.key});

  static const _filterOptions = [
    'Всі',
    'Імплантація',
    'Ортодонтія',
    'Вибілювання зубів',
    'Вініри',
  ];

  static const List<({String name, String position, String question})>
  _videoFaqItems = [
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
    ),
    (
      name: 'Наталія Іванівна Гранда',
      position: 'Лікар стоматолог',
      question: 'Чи боляче ставити імплант?',
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
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Breadcrumb(),
                      const SizedBox(height: AppSpacing.lg),
                      if (isDesktop)
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _HeroTitle()),
                            SizedBox(width: AppSpacing.xl),
                            Expanded(child: _HeroSubtitle()),
                          ],
                        )
                      else
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroTitle(),
                            SizedBox(height: AppSpacing.md),
                            _HeroSubtitle(),
                          ],
                        ),
                      const SizedBox(height: AppSpacing.xl),
                      FilterChipsRow(
                        options: _filterOptions,
                        selected: 'Всі',
                        onSelected: (_) {},
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      if (isDesktop)
                        Wrap(
                          spacing: AppSpacing.md,
                          runSpacing: AppSpacing.md,
                          children: [
                            for (final item in _videoFaqItems)
                              SizedBox(
                                width:
                                    (constraints.maxWidth -
                                        2 * AppSpacing.md) /
                                    3,
                                child: _VideoFaqCard(
                                  name: item.name,
                                  position: item.position,
                                  question: item.question,
                                ),
                              ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            for (final item in _videoFaqItems) ...[
                              _VideoFaqCard(
                                name: item.name,
                                position: item.position,
                                question: item.question,
                              ),
                              if (item != _videoFaqItems.last)
                                const SizedBox(height: AppSpacing.md),
                            ],
                          ],
                        ),
                      const SizedBox(height: AppSpacing.xl),
                      Center(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xl,
                              vertical: AppSpacing.md,
                            ),
                            side: const BorderSide(color: AppColors.line),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.buttonRadius,
                              ),
                            ),
                          ),
                          child: const Text('ПОДИВИТИСЬ БІЛЬШЕ'),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      const _AskDoctorFormSection(),
                    ],
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.navySoft,
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#ЄРІШЕННЯ',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.teal,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  LeadFormSection(
                    title: 'Знайдемо рішення\nдля вашої ситуації теж',
                    subtitle:
                        'Запишіться на консультацію або напишіть нам. '
                        'Розберемось у ситуації, пояснимо варіанти, '
                        'зафіксуємо вартість.',
                    services: const ['Дитяча стоматологія'],
                    submitLabel: 'ЗАПИСАТИСЬ НА КОНСУЛЬТАЦІЮ',
                    onSubmit: (name, phone, service, date) {},
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.cardRadius,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        color: AppColors.cardBg,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: AppColors.muted,
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
                  (label: 'Питання та відповіді', onTap: _noop),
                  (
                    label: 'Контакти',
                    onTap: () => context.go(AppRoutes.contacts),
                  ),
                ],
              },
              phone: 'Запис за телефоном +38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: const [
                (icon: Icons.send, onTap: _noop),
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

void _noop() {}

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb();

  @override
  Widget build(BuildContext context) {
    final mutedStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.muted,
    );
    final inkStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.ink,
    );

    return Wrap(
      children: [
        Text('Головна', style: mutedStyle),
        Text(' / ', style: mutedStyle),
        Text('Питання та відповіді лікарів', style: inkStyle),
      ],
    );
  }
}

class _HeroTitle extends StatelessWidget {
  const _HeroTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Питання та відповіді лікарів',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.ink,
      ),
    );
  }
}

class _HeroSubtitle extends StatelessWidget {
  const _HeroSubtitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Найчастіші запитання, які пацієнти ставлять лікарям особисто — '
      'тепер у форматі коротких відео. Наші спеціалісти відповідають '
      'просто, без страшних термінів і тиску, щоб ви знали, чого '
      'очікувати ще до візиту.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.inkSoft,
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
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              children: [
                Container(
                  color: AppColors.cardBg,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppColors.muted,
                    size: 40,
                  ),
                ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.cardBg,
                  child: Icon(Icons.person, color: AppColors.muted, size: 20),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        position,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: AppColors.muted),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        question,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
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

class _AskDoctorFormSection extends StatefulWidget {
  const _AskDoctorFormSection();

  @override
  State<_AskDoctorFormSection> createState() => _AskDoctorFormSectionState();
}

class _AskDoctorFormSectionState extends State<_AskDoctorFormSection> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _questionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _questionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;
        final image = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            width: isWide ? 320 : double.infinity,
            height: isWide ? 400 : 250,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 48,
            ),
          ),
        );

        final form = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ПИТАННЯ/ВІДПОВІДІ',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
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
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.inkSoft),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Ім'я",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Номер телефону',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _questionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Ваше питання',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.paper,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: form),
                    const SizedBox(width: AppSpacing.lg),
                    image,
                  ],
                )
              : Column(children: [image, const SizedBox(height: AppSpacing.lg), form]),
        );
      },
    );
  }
}
