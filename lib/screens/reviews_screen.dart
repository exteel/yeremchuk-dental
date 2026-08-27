import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';
import 'package:yeremchuk_dental/widgets/app_footer.dart';
import 'package:yeremchuk_dental/widgets/app_top_bar.dart';
import 'package:yeremchuk_dental/widgets/filter_chips_row.dart';
import 'package:yeremchuk_dental/widgets/lead_form_section.dart';
import 'package:yeremchuk_dental/widgets/review_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  static const ({
    String authorName,
    String date,
    int rating,
    String text,
    String serviceTag,
    String doctorName,
  })
  _r = (
    authorName: 'Оксана М.',
    date: '21.07.2026',
    rating: 4,
    text:
        'Нарешті знайшла клініку, де пояснюють що роблять і чому. '
        'Ніякого тиску, ніяких несподіваних цін. Імплант поставили — і я '
        'забула, що він взагалі є.',
    serviceTag: 'Імплантація All-on-4',
    doctorName: 'Лікар: Наталія Іванівна Гранда',
  );

  static const List<
    ({
      String authorName,
      String date,
      int rating,
      String text,
      String serviceTag,
      String doctorName,
    })
  >
  _reviews = [
    _r, _r, _r, _r,
    _r, _r, _r, _r,
    _r, _r, _r, _r,
    _r, _r, _r, _r,
  ];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.paperDim,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxl,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Головна',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: AppColors.muted,
                        ),
                      ),
                      Text(
                        ' / ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: AppColors.muted,
                        ),
                      ),
                      Text(
                        'Відгуки',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      Text(
                        'Відгуки',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.ink,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '4.9',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ink,
                                ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.teal,
                                size: 22,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.teal,
                                size: 22,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.teal,
                                size: 22,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.teal,
                                size: 22,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.teal,
                                size: 22,
                              ),
                            ],
                          ),
                          const SizedBox(width: AppSpacing.lg),
                          Container(
                            width: 1,
                            height: 20,
                            color: AppColors.line,
                          ),
                          const SizedBox(width: AppSpacing.lg),
                          Text(
                            'Google Maps · 200+ відгуків',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.muted),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  FilterChipsRow(
                    options: const [
                      'Всі',
                      'Імплантація',
                      'Ортодонтія',
                      'Вибілювання зубів',
                      'Вініри',
                    ],
                    selected: 'Всі',
                    onSelected: (value) {},
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.lg,
                    children: [
                      for (final review in _reviews)
                        SizedBox(
                          width: 320,
                          child: ReviewCard(
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
                  const SizedBox(height: AppSpacing.xl),
                  const Center(child: _ReviewsPagination()),
                  const SizedBox(height: AppSpacing.xxl),
                  const _LeaveReviewSection(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.navy,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxl,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#ЄРІШЕННЯ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.teal,
                      fontWeight: FontWeight.bold,
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
                    trailing: Container(
                      width: double.infinity,
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.navySoft,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.cardRadius,
                        ),
                      ),
                      child: Icon(
                        Icons.image_not_supported,
                        color: AppColors.paper.withValues(alpha: 0.38),
                        size: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                (icon: Icons.send, onTap: _noop),
                (icon: Icons.camera_alt_outlined, onTap: _noop),
                (icon: Icons.chat_bubble_outline, onTap: _noop),
                (icon: Icons.chat_bubble_outline, onTap: _noop),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void _noop() {}
}

class _ReviewsPagination extends StatelessWidget {
  const _ReviewsPagination();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PaginationArrowButton(icon: Icons.chevron_left, onTap: () {}),
        const SizedBox(width: AppSpacing.lg),
        Text(
          '1/10',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.ink),
        ),
        const SizedBox(width: AppSpacing.lg),
        _PaginationArrowButton(icon: Icons.chevron_right, onTap: () {}),
      ],
    );
  }
}

class _PaginationArrowButton extends StatelessWidget {
  const _PaginationArrowButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.line),
        ),
        child: Icon(icon, color: AppColors.ink, size: 20),
      ),
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

        final imagePlaceholder = ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            width: isWide ? 400 : double.infinity,
            height: 350,
            alignment: Alignment.center,
            color: AppColors.cardBg,
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.muted,
              size: 48,
            ),
          ),
        );

        final form = Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Залишити відгук',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Залиште свій відгук! Ми прагнемо максимально комфортно '
                'обслуговувати та лікувати наших пацієнтів. Допоможіть нам '
                'ставати краще!',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.inkSoft),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ReviewFormField(label: "Ім'я")),
                  SizedBox(width: AppSpacing.md),
                  Expanded(child: _ReviewFormField(label: 'Номер телефону')),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ReviewFormField(label: 'Послуга')),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _ReviewFormField(label: 'Лікар який лікував'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              const _ReviewFormField(label: 'Ваше питання', maxLines: 4),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Ваша оцінка',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.inkSoft),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Row(
                    children: [
                      for (var i = 0; i < 4; i++)
                        const Icon(
                          Icons.star,
                          color: AppColors.amber,
                          size: 22,
                        ),
                      const Icon(
                        Icons.star_border,
                        color: AppColors.amber,
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xl,
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
                ],
              ),
            ],
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: form),
                    const SizedBox(width: AppSpacing.lg),
                    imagePlaceholder,
                  ],
                )
              : Column(
                  children: [
                    form,
                    const SizedBox(height: AppSpacing.lg),
                    imagePlaceholder,
                  ],
                ),
        );
      },
    );
  }
}

class _ReviewFormField extends StatelessWidget {
  const _ReviewFormField({required this.label, this.maxLines = 1});

  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSpacing.sm)),
      borderSide: BorderSide(color: AppColors.line),
    );
    const focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSpacing.sm)),
      borderSide: BorderSide(color: AppColors.teal),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.inkSoft),
        ),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          maxLines: maxLines,
          decoration: const InputDecoration(
            border: border,
            enabledBorder: border,
            focusedBorder: focusedBorder,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
          ),
        ),
      ],
    );
  }
}
