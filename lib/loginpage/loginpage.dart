import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        
                children: [
          Image.asset(
            'assets/images/image_elite.png',
            height: 480,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15, bottom: 15, right: 100, left: 100),
            child: TextFormField(
              // controller: _userEmailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,

              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your email ",
                labelStyle: TextStyle(color: Colors.black),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                // suffixIcon: IconButton(
                // // icon: Icon(
                // // _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                // // color: Colors.black,
                // // ),
                // onPressed: () {
                // // setState(() {
                // // isPasswordVisible = !isPasswordVisible;
                // // });
                // }),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan, width: 2),
                ),
              ),
              // onFieldSubmitted: (_) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
              // },
              // validator: (value) => _emailValidation(value!),
              // decoration: CommonStyles.textFormFieldStyle("Email", ""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 100, left: 100),
            child: TextFormField(
              // controller: _userPasswordController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                // FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              // validator: (value) => _userNameValidation(value!),
              // obscureText: _isPasswordVisible,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                labelStyle: TextStyle(color: Colors.black),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    }),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Reset Password",
                  style: TextStyle(decoration: TextDecoration.underline,color: Colors.cyan),
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Container(
              height: 45,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                child: Text(
                  "Sign in with email",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  // _signUpProcess(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}