import 'package:flutter/material.dart';

import 'CommonFunction.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField(
      {Key? key,
        // required this.title,
        required this.controller,
        required this.placeholder,
        required this.keyboardType,
        required this.onChanged,
        this.isLastTextField = false,
        // this.maxLength = 40,
        this.isSecure = false,
        this.suffixIcon,
        this.enabled = true,
        this.suffixPressed,
        this.isShowForget = false,
        this.forgetPressed,
        this.maxLines = 1,

      }) : super(key: key);

  // final String title;
  final String placeholder;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool isLastTextField;
  // final int maxLength;// = 40;
  final bool isSecure;// = false;
  final Widget? suffixIcon;// = null;
  final void Function()? suffixPressed;
  final bool enabled;// = true;
  final void Function(String)? onChanged;
  final bool isShowForget;
  final void Function()? forgetPressed;
  final int maxLines;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {

  static const kLightGrey = Color(0xFFA4A6B3);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CommonFunction.shared.setCommonText(widget.title,
            //         color: kLightGrey, fontSize: 12, fontWeight: FontWeight.bold),
            //     GestureDetector(
            //       onTap: widget.forgetPressed,
            //       child: CommonFunction.shared.setCommonText(
            //           widget.isShowForget ? 'Forgot password?' : '',
            //           color: kLightGrey,
            //           fontSize: 12,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(fontSize: 20),
              textCapitalization: TextCapitalization.characters,
              maxLines: widget.maxLines,
              // maxLength: widget.maxLength,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.isSecure,
              textInputAction:
              widget.isLastTextField ? TextInputAction.done : TextInputAction.next,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                fillColor: Color(0xffFCFDFE),
                // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                contentPadding: EdgeInsets.all(10),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(8.0),
                //     borderSide: BorderSide(color: kLightGrey, width: 1)),
                hintText: widget.placeholder,
                labelText: widget.placeholder,
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                suffixIcon: widget.suffixIcon != null
                    ? IconButton(
                    icon: widget.suffixIcon!,
                    onPressed: () {
                      widget.suffixPressed!();
                    })
                    : null,
              ),
              // validator: validator,
              // enabled: enabled,
            )
          ],
        ));
  }
}
