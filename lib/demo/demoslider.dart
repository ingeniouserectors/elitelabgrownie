// import 'package:flutter/material.dart';
//
// class slider extends StatefulWidget {
//   const slider({Key? key}) : super(key: key);
//
//   @override
//   State<slider> createState() => _sliderState();
// }
//
// class _sliderState extends State<slider> {
//
//   RangeValues values = RangeValues(10, 90);
//   RangeValues valuesBottom = RangeValues(0,2);
//
//   final double min = 0;
//   final double max = 80;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   buildSideLable(min),
//   Expanded(
//     child: RangeSlider(values: values,
//           min: min,
//           max: max,
//           divisions: 20,
//           labels: RangeLabels(
//             values.start.round().toString(),
//             values.end.round().toString(),
//           ),
//           onChanged:(values)=>
//     setState(() {
//         this.values = values;
//     })),
//   ),
//   buildSideLable(max),
// ],
//       ),
//     );
//   }
//
//
//   Widget buildSliderTopLabel(){
//     final labels =["0","10","20","30","40"];
//     final double min = 0;
//     final double max = labels.length-1.0;
//     final divison = (max-min).toInt();
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 18),
//         child:Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: utils.modelBuilder(
//             labels,(index,labels){}
//           ),
//         ) ,
//       )
//       RangeSlider(values: valuesBottom,
//           max: max,
//           min: min,
//           onChanged:(values)=>
//               setState(() {
//                 this.valuesBottom = values;
//               }))
//     ],
//   );
//   }
//
//
//   Widget buildSideLable (double value) => Container(
//     width: 30,
//     child: Text(
//       value.round().toString(),
//       style: TextStyle(fontSize: 18),
//       textAlign: TextAlign.center,
//     ),
//   );
//
//
// }
//
// class Utils{
//   static List<Widget>modelBuilder<M>(
//       List<M> models,Widget Function (int index ,M model){
//
// }
//       )
// }

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  // Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfSlider(
            min: 0.0,
            max: 100.0,
            interval: 20,
            showTicks: true,
            showLabels: true,
            value: _value,
            labelPlacement: LabelPlacement.betweenTicks,
            labelFormatterCallback: (dynamic actualValue, String formattedText) {
              switch (actualValue) {
                case 0:
                  return 'IDEAL';
                case 20:
                  return 'EXCELLENT';
                case 40:
                  return 'VERY GOOD';
                case 60:
                  return 'FAIR';
                case 80:
                  return 'NONE';
              }
              return actualValue.toString();
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
