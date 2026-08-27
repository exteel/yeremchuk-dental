import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class FaqItem {
  const FaqItem({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}

class FaqAccordion extends StatefulWidget {
  const FaqAccordion({
    required this.items,
    this.initiallyExpandedIndex = 0,
    super.key,
  });

  final List<FaqItem> items;
  final int initiallyExpandedIndex;

  @override
  State<FaqAccordion> createState() => _FaqAccordionState();
}

class _FaqAccordionState extends State<FaqAccordion> {
  late int _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = widget.initiallyExpandedIndex;
  }

  void _toggleItem(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.items.length; i++) ...[
          _FaqItemTile(
            item: widget.items[i],
            isExpanded: _expandedIndex == i,
            onTap: () => _toggleItem(i),
          ),
          if (i < widget.items.length - 1)
            const Divider(
              color: AppColors.line,
              height: 1,
            ),
        ],
      ],
    );
  }
}

class _FaqItemTile extends StatelessWidget {
  const _FaqItemTile({
    required this.item,
    required this.isExpanded,
    required this.onTap,
  });

  final FaqItem item;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final shouldReduceMotion = MediaQuery.of(context).disableAnimations;
    final animationDuration =
        shouldReduceMotion ? Duration.zero : const Duration(milliseconds: 300);

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.question,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: animationDuration,
                  child: Icon(
                    isExpanded ? Icons.close : Icons.add,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: animationDuration,
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.answer,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.inkSoft,
                                  ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
