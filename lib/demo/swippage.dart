import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecom/demo/demodraggable.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  late PageController hPagerController;
  PageController vPagerController = PageController(keepPage: true);

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    hPagerController = PageController(keepPage: true, initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    // 600 = MediaQuery.of(context).size.width;
    // mHeight = MediaQuery.of(context).size.height;
    return PageView(
      controller: hPagerController,
      children: [
        _verticalPageView(
            [Colors.blue, Colors.purpleAccent, Colors.pinkAccent, Colors.orangeAccent]),
        _verticalPageView01([Colors.yellow, Colors.orange, Colors.deepOrange, Colors.red]),
        _verticalPageView1([Colors.yellow, Colors.orange, Colors.deepOrange, Colors.red]),
        _verticalPageView2(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
        _verticalPageView3(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
        _verticalPageView4(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
        _verticalPageView5(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
        _verticalPageView6(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
        _verticalPageView7(
            [Colors.green, Colors.lightGreenAccent, Colors.greenAccent, Colors.lightBlueAccent]),
      ],
    );
  }

  Widget _verticalPageView(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample()),
      ],
    );
  }

  Widget _verticalPageView01(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample01()),
      ],
    );
  }

  Widget _verticalPageView1(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample4()),
      ],
    );
  }

  Widget _verticalPageView2(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample1()),
      ],
    );
  }

  Widget _verticalPageView3(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample2()),
      ],
    );
  }

  Widget _verticalPageView4(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample3()),
      ],
    );
  }

  Widget _verticalPageView5(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample5()),
      ],
    );
  }

  Widget _verticalPageView6(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample6()),
      ],
    );
  }

  Widget _verticalPageView7(List colors) {
    return PageView(
      controller: vPagerController,
      scrollDirection: Axis.vertical,
      children: [
        Container(
            width: 600, height: 800, color: colors[0], child: DraggableScrollableSheetExample7()),
      ],
    );
  }
}
