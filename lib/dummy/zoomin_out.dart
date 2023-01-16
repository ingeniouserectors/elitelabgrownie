import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PinchZoom Page'),
      ),
      body:
      InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2,
        child:
        Image.network('https://placekitten.com/640/360',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
        ),

      ),
    );
  }
}