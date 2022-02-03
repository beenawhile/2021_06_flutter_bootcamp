import 'dart:math';

import 'package:animation_course/6_routes/repository/content_repository.dart';
import 'package:animation_course/6_routes/ux/styles/styles.dart';
import 'package:animation_course/6_routes/ux/widgets/logo_container.dart';
import 'package:flutter/material.dart';

class ZoomPageScroll extends StatefulWidget {
  const ZoomPageScroll({
    Key? key,
    required this.pageController,
    required this.value,
  }) : super(key: key);

  final PageController pageController;
  final ValueNotifier<double> value;

  @override
  _ZoomPageScrollState createState() => _ZoomPageScrollState();
}

class _ZoomPageScrollState extends State<ZoomPageScroll> {
  static const double _scrollBarHeight = 200.0;
  static const int _initialPage = 2; // todo

  static const scaleFraction = 0.7;
  static const fullScale = 1.0;

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      widget.value.value = _pageController.position.pixels /
          _pageController.position.maxScrollExtent;
      setState(() {
        page = _pageController.page;
      });
    }
    return true;
  }

  PageController get _pageController => widget.pageController;

  double? page = 2.0;
  int _currentPage = _initialPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            contentData[_currentPage].title,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: gummentalColor,
                ),
          ),
        ),
        SizedBox(
          height: _scrollBarHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: PageView.builder(
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              controller: _pageController,
              itemCount: contentData.length,
              itemBuilder: (context, index) {
                final scale =
                    max(scaleFraction, fullScale - (index - page!).abs());
                return LogoContainer(content: contentData[index], scale: scale);
              },
            ),
          ),
        ),
      ],
    );
  }
}
