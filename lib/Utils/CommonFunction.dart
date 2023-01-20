
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class CommonFunction {
  static final CommonFunction shared = CommonFunction._internal();

  factory CommonFunction() {
    return shared;
  }

  CommonFunction._internal();

  setCommonText(String title,
      {dynamic color = Colors.black,
        int fontSize = 15,
        dynamic fontWeight = FontWeight.normal,
        dynamic noOfLine = 1,
        TextAlign textAlignment = TextAlign.start,
        double minFontSize = 10}) {
    return AutoSizeText(
      title,
      textDirection: TextDirection.ltr,
      textAlign: textAlignment,
      style: TextStyle(
        color: color,
        fontSize: double.parse(fontSize.toString()),
        fontWeight: fontWeight,
        // fontFamily: 'OpenSans',
      ),
      maxLines: noOfLine,
      overflow: TextOverflow.ellipsis,
      wrapWords: true,
      minFontSize: minFontSize,
    );
  }

  Widget shadowThemeButton(
      String title, double height, GestureTapCallback onTap,
      {double? width, Color BGColor = kLightGrey, Color textColor = Colors.black}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: BGColor,
              borderRadius: BorderRadius.circular(8),
          //     boxShadow: [
          //       // BoxShadow(
          //       //   color: clr.withOpacity(0.2),
          //       //   spreadRadius: 2,
          //       //   blurRadius: 5,
          //       //   offset: Offset(2, 5),
          //       // ),
          //     ]
          ),
          child: Align(
            alignment: Alignment.center,
            child:
            CommonFunction.shared.setCommonText(title, color: textColor),
          )),
    );
  }

  showSnackBar(String title, {String label = ''}) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(title),
      action: SnackBarAction(
        label: label,
        onPressed: () {},
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }


  Widget richText(String key, String value){
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: key),
          TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

}