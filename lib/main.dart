import 'package:dosiin_scroll_demo/widgets/carousel_menu_widget.dart';
import 'package:dosiin_scroll_demo/widgets/menu_item.dart';
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
  bool isInitedPadding = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isInitedPadding = true;
      });
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
              (index) => MenuItem(
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
          isInitedPadding: isInitedPadding,
        ),
      ),
    );
  }
}
