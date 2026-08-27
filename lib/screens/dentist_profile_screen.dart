import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/arrow_carousel.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/stat_badge.dart';

class DentistProfileScreen extends StatelessWidget {
  const DentistProfileScreen({super.key});

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
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Breadcrumb(),
                  SizedBox(height: AppSpacing.lg),
                  _DoctorHero(),
                ],
              ),
            ),
            Container(
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: const _DoctorDetailsSection(),
            ),
            Container(
              color: AppColors.paper,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: const _LeaveReviewSection(),
            ),
            Container(
              color: AppColors.paper,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl,
              ),
              child: const _AskQuestionSection(),
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
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.md),
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
                        width: 320,
                        height: 320,
                        color: AppColors.navySoft,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white54,
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
                  (label: 'Ортодонтія', onTap: () {}),
                  (label: 'Вибілювання зубів', onTap: () {}),
                  (label: 'Профілактична стоматологія', onTap: () {}),
                  (label: 'Віньри естетичне протезування', onTap: () {}),
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
              phone: '+38(050) 310-98-04',
              email: 'royal.med.if@gmail.com',
              socialLinks: [
                (icon: Icons.send, onTap: () {}),
                (icon: Icons.camera_alt, onTap: () {}),
                (icon: Icons.phone, onTap: () {}),
                (icon: Icons.chat, onTap: () {}),
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
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.muted,
        );

    return Row(
      children: [
        Text('Головна', style: style),
        Text(' / ', style: style),
        Text('Лікарі', style: style),
        Text(' / ', style: style),
        Text('Любінець Марина Михайлівна', style: style),
      ],
    );
  }
}

class _DoctorHero extends StatelessWidget {
  const _DoctorHero();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final infoColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'СТОМАТОЛОГ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Любінець Марина Михайлівна',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
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
                    Icons.medical_services,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Спеціалізація:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                    Text(
                      'Терапевтична дитяча стоматологія',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            const Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _StaticTag(label: 'Терапевтичне лікування дитячих зубів'),
                _StaticTag(label: 'Ендодонтичне лікування'),
                _StaticTag(label: 'Стоматологічні маніпуляції уві сні'),
              ],
            ),
          ],
        );

        final photo = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            height: 420,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.person,
              color: AppColors.muted,
              size: 96,
            ),
          ),
        );

        final asideColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: StatBadge(
                value: '8+',
                label: 'років досвіду',
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Марина Михайлівна — досвідчений дитячий стоматолог, яка вже '
              'понад 8 років допомагає маленьким пацієнтам зберігати здорові '
              'та красиві усмішки. Вона відома своєю уважністю, '
              'доброзичливим підходом та вмінням знайти спільну мову з '
              'дітьми, завдяки чому лікування проходить спокійно та без '
              'стресу.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today, size: 18),
                label: const Text('ЗАПИСАТИСЬ НА ПРИЙОМ'),
              ),
            ),
          ],
        );

        if (!isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              infoColumn,
              const SizedBox(height: AppSpacing.lg),
              photo,
              const SizedBox(height: AppSpacing.lg),
              asideColumn,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: infoColumn),
            const SizedBox(width: AppSpacing.lg),
            Expanded(flex: 4, child: photo),
            const SizedBox(width: AppSpacing.lg),
            Expanded(flex: 3, child: asideColumn),
          ],
        );
      },
    );
  }
}

class _StaticTag extends StatelessWidget {
  const _StaticTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.inkSoft,
            ),
      ),
    );
  }
}

class _DoctorDetailsSection extends StatelessWidget {
  const _DoctorDetailsSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        const sidebar = _DetailsSidebar();
        const content = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _EducationBlock(),
            SizedBox(height: AppSpacing.xxl),
            _CoursesBlock(),
            SizedBox(height: AppSpacing.xxl),
            _CredoBlock(),
            SizedBox(height: AppSpacing.xxl),
            _CertificatesBlock(),
          ],
        );

        if (!isWide) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sidebar,
              SizedBox(height: AppSpacing.lg),
              content,
            ],
          );
        }

        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 260, child: sidebar),
            SizedBox(width: AppSpacing.xl),
            Expanded(child: content),
          ],
        );
      },
    );
  }
}

class _DetailsSidebar extends StatelessWidget {
  const _DetailsSidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paperDim,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SidebarNavItem(label: 'Освіта', isSelected: true),
          _SidebarNavItem(label: 'Курси та підвищення кваліфікації'),
          _SidebarNavItem(label: 'Професійне кредо'),
          _SidebarNavItem(label: 'Сертифікати'),
          _SidebarNavItem(label: 'Запис на прийом'),
        ],
      ),
    );
  }
}

class _SidebarNavItem extends StatelessWidget {
  const _SidebarNavItem({required this.label, this.isSelected = false});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.paper : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? AppColors.ink : AppColors.inkSoft,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}

class _EducationBlock extends StatelessWidget {
  const _EducationBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Освіта',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.navy,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const _TimelineEntry(
          period: '2010-2015',
          description: 'Навчання Ужгородський стоматологічний факультет',
        ),
        const _TimelineEntry(
          period: '2015-2017',
          description:
              'Інтернатура за спеціальністю дитяча стоматологія',
          isLast: true,
        ),
      ],
    );
  }
}

class _CoursesBlock extends StatelessWidget {
  const _CoursesBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Курси та підвищення кваліфікації',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.navy,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const _TimelineEntry(
          period: '2018',
          description: '«Дитяча стоматологія від А до Я»',
        ),
        const _TimelineEntry(
          period: '2019',
          description: '«Saving teeth peRio concept»',
        ),
        const _TimelineEntry(
          period: '2019',
          description: '«Saving teeth peRio concept»',
          isLast: true,
        ),
      ],
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.period,
    required this.description,
    this.isLast = false,
  });

  final String period;
  final String description;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Text(
                period,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                const Expanded(
                  child: SizedBox(
                    width: 2,
                    child: ColoredBox(color: AppColors.line),
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.inkSoft,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CredoBlock extends StatelessWidget {
  const _CredoBlock();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 700;

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            height: 220,
            width: isWide ? 320 : double.infinity,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 40,
            ),
          ),
        );

        final quote = Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.lg,
                  top: AppSpacing.md,
                ),
                child: Text(
                  'Кожна дитина заслуговує на здорову усмішку без страху '
                  'перед стоматологом.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.navy,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.format_quote,
                  color: AppColors.tealSoft,
                  size: 72,
                ),
              ),
            ],
          ),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Професійне кредо',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image,
                  const SizedBox(width: AppSpacing.lg),
                  quote,
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image,
                  const SizedBox(height: AppSpacing.lg),
                  quote,
                ],
              ),
          ],
        );
      },
    );
  }
}

class _CertificatesBlock extends StatelessWidget {
  const _CertificatesBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Сертифікати',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.navy,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ArrowCarousel<int>(
          items: const [0, 1, 2, 3],
          itemWidth: 320,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  color: AppColors.paperDim,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppColors.muted,
                    size: 40,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _LeaveReviewSection extends StatelessWidget {
  const _LeaveReviewSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final textColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Залиште свій відгук!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Ми прагнемо максимально комфортно обслуговувати та лікувати '
              'наших пацієнтів. Допоможіть нам ставати краще!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ЗАЛИШИТИ ВІДГУК'),
            ),
          ],
        );

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            height: 220,
            width: isWide ? 320 : double.infinity,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 40,
            ),
          ),
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.paperDim,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: isWide
              ? Row(
                  children: [
                    Expanded(child: textColumn),
                    const SizedBox(width: AppSpacing.lg),
                    image,
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    textColumn,
                    const SizedBox(height: AppSpacing.lg),
                    image,
                  ],
                ),
        );
      },
    );
  }
}

class _AskQuestionSection extends StatefulWidget {
  const _AskQuestionSection();

  @override
  State<_AskQuestionSection> createState() => _AskQuestionSectionState();
}

class _AskQuestionSectionState extends State<_AskQuestionSection> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            height: 320,
            width: isWide ? 320 : double.infinity,
            color: AppColors.cardBg,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 40,
            ),
          ),
        );

        final formColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ПИТАННЯ/ВІДПОВІДІ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.muted,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Задайте питання лікарю або запишіться на прийом',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                _TabButton(
                  label: 'Задати питання',
                  isSelected: _selectedTab == 0,
                  onTap: () => setState(() => _selectedTab = 0),
                ),
                const SizedBox(width: AppSpacing.sm),
                _TabButton(
                  label: 'Записатись на прийом',
                  isSelected: _selectedTab == 1,
                  onTap: () => setState(() => _selectedTab = 1),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Ім'я",
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Номер телефону',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Ваше питання',
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ВІДПРАВИТИ'),
            ),
          ],
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.paper,
            border: Border.all(color: AppColors.line),
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image,
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(child: formColumn),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    image,
                    const SizedBox(height: AppSpacing.lg),
                    formColumn,
                  ],
                ),
        );
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.tealSoft : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? AppColors.tealDark : AppColors.muted,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
