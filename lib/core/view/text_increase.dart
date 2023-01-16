import 'package:flutter/material.dart';

class TextIncrease extends StatefulWidget {
  final double fontSize;
  final Function(double) newFontSize;
  const TextIncrease({Key? key, required this.fontSize, required this.newFontSize})
      : super(key: key);

  @override
  State<TextIncrease> createState() => _TextIncreaseState();
}

class _TextIncreaseState extends State<TextIncrease> {
  late double fontSize;

  @override
  void initState() {
    fontSize = widget.fontSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding:  EdgeInsets.only(top:30.0,bottom: 30),
                  child: StatefulBuilder(
                    builder: (BuildContext context, myS) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Aa',
                                  style:
                                      TextStyle(fontSize: 18, color: Colors.grey[670], height: 1.5),
                                ),
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'Aa',
                                  style:
                                      TextStyle(fontSize: 30, color: Colors.grey[670], height: 1.5),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Aa',
                                  style:
                                      TextStyle(fontSize: 40, color: Colors.grey[670], height: 1.5),
                                ),
                              )),
                            ],
                          ),
                          Slider(
                            value: fontSize,
                            max: 54,
                            min: 18,
                            divisions: 4,
                            label: fontSize.round().toString(),
                            onChanged: (double value) {
                              myS(() {
                                fontSize = value;
                              });
                              widget.newFontSize(value);
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              });
        },
        icon: Image.asset('assets/images/font.png'),iconSize: 40,);
  }
}
