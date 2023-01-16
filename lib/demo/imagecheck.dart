import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class visiblecontainer extends StatefulWidget {
  const visiblecontainer({Key? key}) : super(key: key);

  @override
  State<visiblecontainer> createState() => _visiblecontainerState();
}

class _visiblecontainerState extends State<visiblecontainer> {

  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           SizedBox(
             height: 10,
           ),
           GestureDetector(
             onTap: (){
               setState(() {
                 isvisible = !isvisible;

               });
             },
             child: Visibility(
               visible: isvisible,
               child: Container(
                 height: 200,
                 width: 250,
                 color: Colors.cyan,
               ),
             ),


           ),
           GestureDetector(
             onTap: (){
               setState(() {
                 isvisible = !isvisible;
               });
             },
             child: Visibility(
               visible: !isvisible,
               child: Container(
                 height: 200,
                 width: 250,
                 color: Colors.black,
               ),
             ),
           ),
         ],
       ),
    );
  }
}
