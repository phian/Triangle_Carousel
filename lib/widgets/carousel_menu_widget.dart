import 'package:carousel_slider/carousel_slider.dart';
import 'package:dosiin_scroll_demo/widgets/carousel_menu_item.dart';
import 'package:flutter/material.dart';

class CarouselMenuWidget extends StatefulWidget {
  final List<CarouselMenuItem> items;
  final Function(int index, CarouselPageChangedReason reason)? onPageChange;
  final Function(double? offset)? onScroll;
  final int initPage;
  final double? containerHeight;
  final double carouselOptionHeight;
  final double? viewportFraction;
  final bool? enlargeCenterPage;
  final bool isFinishedInitPadding;

  const CarouselMenuWidget({
    Key? key,
    required this.items,
    required this.initPage,
    required this.carouselOptionHeight,
    required this.isFinishedInitPadding,
    this.viewportFraction,
    this.onPageChange,
    this.onScroll,
    this.containerHeight,
    this.enlargeCenterPage,
  }) : super(key: key);

  @override
  _CarouselSlideMenuWidgetState createState() =>
      _CarouselSlideMenuWidgetState();
}

class _CarouselSlideMenuWidgetState extends State<CarouselMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight ?? 300.0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: widget.isFinishedInitPadding ? 1 : 0,
        child: CarouselSlider(
          items: widget.items,
          options: CarouselOptions(
            height: widget.carouselOptionHeight,
            viewportFraction: widget.viewportFraction ?? 1.0,
            initialPage: widget.initPage,
            enableInfiniteScroll: true,
            enlargeCenterPage: widget.enlargeCenterPage ?? false,
            onPageChanged: (index, reason) {
              widget.onPageChange?.call(index, reason);
            },
            onScrolled: (offset) {
              widget.onScroll?.call(offset ?? 0.0);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
