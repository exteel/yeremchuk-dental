import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';

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

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

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
        navItems: const [
          (label: 'Послуги', onTap: _noop),
          (label: 'Про нас', onTap: _noop),
          (label: 'Ціни', onTap: _noop),
          (label: 'Стоматологічний туризм', onTap: _noop),
          (label: 'Для пацієнтів', onTap: _noop),
          (label: 'Контакти', onTap: _noop),
        ],
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _ContactsMainSection(),
            const _LeadFormWrapper(),
            AppFooter(
              logoText: 'YEREMCHUK DENTAL',
              rating: 4.9,
              reviewCount: 200,
              cities: const ['Івано-Франківськ', 'Чернівці'],
              linkColumns: {
                'ПОСЛУГИ': [
                  for (final label in _serviceLinks)
                    (label: label, onTap: _noop),
                ],
                'ПАЦІЄНТАМ': const [
                  (label: 'Про нас', onTap: _noop),
                  (label: 'Ціни', onTap: _noop),
                  (label: 'Стоматологічний туризм', onTap: _noop),
                  (label: 'Новини', onTap: _noop),
                  (label: 'Питання та відповіді', onTap: _noop),
                  (label: 'Контакти', onTap: _noop),
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

class _ContactsMainSection extends StatelessWidget {
  const _ContactsMainSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.paperDim,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Головна',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ),
              Text(
                ' / ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.muted,
                ),
              ),
              Text(
                'Контакти',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Контакти',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const FilterChipsRow(
            options: ['Івано-Франківськ', 'Чернівці'],
            selected: 'Івано-Франківськ',
            onSelected: _noopString,
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              if (isDesktop) {
                return const IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _ContactInfoCard()),
                      SizedBox(width: AppSpacing.lg),
                      Expanded(flex: 2, child: _MapPlaceholder()),
                    ],
                  ),
                );
              }

              return const Column(
                children: [
                  _ContactInfoCard(),
                  SizedBox(height: AppSpacing.lg),
                  _MapPlaceholder(),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          const _ReachUsSection(),
        ],
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard();

  static const List<({String label, String value})> _rows = [
    (label: 'Адреса', value: 'вул. Військова, 1'),
    (label: 'Години роботи', value: 'Пн–Сб 8:00–20:00'),
    (label: 'Запис за телефоном', value: '+38(050) 310-98-04'),
    (label: 'E-mail', value: 'royal.med.if@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final row in _rows) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    row.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    row.value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.inkSoft,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          Row(
            children: [
              _SocialIconButton(icon: Icons.telegram, onTap: () {}),
              const SizedBox(width: AppSpacing.sm),
              _SocialIconButton(icon: Icons.camera_alt, onTap: () {}),
              const SizedBox(width: AppSpacing.sm),
              _SocialIconButton(icon: Icons.chat, onTap: () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.line),
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                ),
              ),
              child: const Text('ПРОКЛАСТИ МАРШРУТ'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.navy,
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
        splashRadius: 20,
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Stack(
          children: [
            Container(color: AppColors.cardBg),
            Center(
              child: Container(
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
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.danger,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Flexible(
                      child: Text(
                        'Yeremchuk Dental (ROYAL DENTAL)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.ink,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: AppSpacing.sm,
              bottom: AppSpacing.sm,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.my_location,
                  size: 18,
                  color: AppColors.inkSoft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReachUsSection extends StatelessWidget {
  const _ReachUsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 900;

          final photo = ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            child: _PlaceholderImage(aspectRatio: isDesktop ? 4 / 3 : 16 / 10),
          );

          final textColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Зв’яжіться з нами\nзручним для вас способом',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.md,
                runSpacing: AppSpacing.md,
                children: const [
                  _ContactMethodButton(
                    label: 'INSTAGRAM',
                    icon: Icons.camera_alt,
                  ),
                  _ContactMethodButton(label: 'VIBER', icon: Icons.chat),
                  _ContactMethodButton(
                    label: 'WHATSAPP',
                    icon: Icons.chat_bubble,
                  ),
                ],
              ),
            ],
          );

          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: photo),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: textColumn),
              ],
            );
          }

          return Column(
            children: [
              photo,
              const SizedBox(height: AppSpacing.lg),
              textColumn,
            ],
          );
        },
      ),
    );
  }
}

class _ContactMethodButton extends StatelessWidget {
  const _ContactMethodButton({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ink,
        side: const BorderSide(color: AppColors.navy),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: AppSpacing.sm),
          Icon(icon, size: 18, color: AppColors.teal),
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
      color: AppColors.navy,
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
