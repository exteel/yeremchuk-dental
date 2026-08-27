import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class ArrowCarousel<T> extends StatefulWidget {
  const ArrowCarousel({
    required this.items,
    required this.itemBuilder,
    required this.itemWidth,
    this.gap = AppSpacing.md,
    this.showDots = true,
    super.key,
  });

  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final double itemWidth;
  final double gap;
  final bool showDots;

  @override
  State<ArrowCarousel<T>> createState() => _ArrowCarouselState<T>();
}

class _ArrowCarouselState<T> extends State<ArrowCarousel<T>> {
  late ScrollController _scrollController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pageIndex = (
      _scrollController.offset /
      (widget.itemWidth + widget.gap)
    ).round().clamp(0, widget.items.length - 1);
    if (_currentPageIndex != pageIndex) {
      setState(() {
        _currentPageIndex = pageIndex;
      });
    }
  }

  void _scrollToPrevious() {
    final offset = (_scrollController.offset - (widget.itemWidth + widget.gap))
        .clamp(0.0, double.infinity);
    _animateToOffset(offset);
  }

  void _scrollToNext() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final offset = (_scrollController.offset + (widget.itemWidth + widget.gap))
        .clamp(0.0, maxScroll);
    _animateToOffset(offset);
  }

  void _animateToOffset(double offset) {
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    if (disableAnimations) {
      _scrollController.jumpTo(offset);
    } else {
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get _canScrollPrevious {
    if (!_scrollController.hasClients) return false;
    return _scrollController.offset > 0;
  }

  bool get _canScrollNext {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    return _scrollController.offset < maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: _canScrollPrevious ? _scrollToPrevious : null,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var index = 0; index < widget.items.length; index++)
                      SizedBox(
                        width: widget.itemWidth,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index < widget.items.length - 1
                                ? widget.gap
                                : 0,
                          ),
                          child: widget.itemBuilder(
                            context,
                            widget.items[index],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _canScrollNext ? _scrollToNext : null,
            ),
          ],
        ),
        if (widget.showDots && widget.items.length > 1)
          Padding(
            padding: EdgeInsets.only(top: widget.gap),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.items.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widget.gap / 2),
                    child: Container(
                      height: 8,
                      width: _currentPageIndex == i ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPageIndex == i
                            ? AppColors.teal
                            : AppColors.line,
                        borderRadius: BorderRadius.circular(4),
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
