import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CONTAINER extends StatefulWidget {
  const CONTAINER({Key? key}) : super(key: key);

  @override
  State<CONTAINER> createState() => _CONTAINERState();
}

class _CONTAINERState extends State<CONTAINER> {
  bool isvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isvalue = !isvalue;
              });

            },
            child: Container(
              height: 200,
              width: 400,
              color: Colors.black54,
              child: Icon(isvalue?Icons.done:Icons.add)
            ),
          ),
        ],
      ),
    );
  }
}
