import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class sfsilderclassd extends StatefulWidget {
  const sfsilderclassd({Key? key}) : super(key: key);

  @override
  State<sfsilderclassd> createState() => _sfsilderclassdState();
}

class _sfsilderclassdState extends State<sfsilderclassd> {
  double _lvalue = 0.0;
  double _uvalue = 100.0;
  RangeValues values = RangeValues(0.0,100.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 30,
                  thumbColor: Colors.white,
                  valueIndicatorColor: Colors.teal,
                  overlayColor: Colors.amber,
                    minThumbSeparation: 100,
                ),
                child: RangeSlider(
                  labels: RangeLabels(values.start.toString(),values.end.toString()),
                  activeColor: Colors.purple,
                  inactiveColor: Colors.deepPurple,
                   divisions: 5,
                   min: _lvalue,
                  max: _uvalue,
                values: values,
                  onChanged: (RangeValues value) {
                     setState(() {
                       values = value;
                     });
                  },
                ),
              ),
            )
        )
    );
  }
}
