import 'package:dosiin_scroll_demo/widgets/carousel_menu_item.dart';
import 'package:dosiin_scroll_demo/widgets/carousel_menu_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Triangle Scroll Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentCenterIndex = 2;
  bool _isFinishedInitPadding = false;

  @override
  void initState() {
    super.initState();
    updateIsInit();
  }

  Future updateIsInit() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _isFinishedInitPadding = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselMenuWidget(
          items: [
            ...List.generate(
              100,
                  (index) => CarouselMenuItem(
                key: ValueKey(index),
                index: index,
                isCenter: currentCenterIndex == index,
              ),
            ),
          ],
          carouselOptionHeight: 400.0,
          initPage: 2,
          onScroll: (offset) {
            setState(() {});
          },
          onPageChange: (index, reason) {
            setState(() {
              currentCenterIndex = index;
            });
          },
          containerHeight: MediaQuery.of(context).size.height,
          isFinishedInitPadding: _isFinishedInitPadding,
          viewportFraction: 0.23,
        ),
      ),
    );
  }
}
