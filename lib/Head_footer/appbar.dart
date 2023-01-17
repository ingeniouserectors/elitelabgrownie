// import 'dart:io';
// import 'package:ecom/Pages/drawer.dart';
// import 'package:ecom/search.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class bappbar extends StatefulWidget {
//
//
//   @override
//   State<bappbar> createState() => _bappbarState();
// }
//
// class _bappbarState extends State<bappbar> {
//   File? _image;
//
//   final imagePicker = ImagePicker();
//
//   Future getImage() async {
//     final image = await imagePicker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       _image = File(image!.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       drawer: Drawer(
//         child: drawer(),
//       ),
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/flux.png',
//           height: 25,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(right: 1, left: 2),
//             child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.camera_alt,
//                   color: Colors.black,
//                 )),
//           ),
//           IconButton(
//             onPressed: () {
//               // method to show the search bar
//               showSearch(
//                   context: context,
//                   // delegate to customize the search bar
//                   delegate: CustomSearchDelegate());
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//     );
//   }
// }
// import 'dart:io';
//
// import 'package:ecom/Notification.dart';
// import 'package:ecom/search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class SaneAppBar extends StatelessWidget implements PreferredSizeWidget {
//
//   // You also need to override the preferredSize attribute.
//   // You can set it to kToolbarHeight to get the default appBar height.
//   @override
//   Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
//
//
//   File? _image;
//   final imagePicker = ImagePicker();
//
//   Future getImage() async {
//     final image = await imagePicker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       _image = File(image!.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//          AppBar(
//         toolbarHeight: 90,
//         leading:Builder(builder: (context)=>
//         Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: IconButton(icon:ImageIcon(AssetImage("assets/images/Bottom/dr.png")),
//             onPressed: (){Scaffold.of(context).openDrawer();}
//             ,),
//         )),
//
//     title: Image.asset(
//     'assets/images/image_elite.png',
//     height: 55,
//     ),
//     centerTitle: true,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     iconTheme: IconThemeData(color: Colors.black),
//     actions: <Widget>[
//     Padding(
//     padding: EdgeInsets.only(right: 1, left: 2),
//     child: IconButton(
//     onPressed: getImage,
//     icon: Icon(
//     Icons.camera_alt_outlined,
//     color: Colors.grey,
//     )),
//     ),
//     IconButton(
//     onPressed: () {
//     // method to show the search bar
//     showSearch(
//     context: context,
//     // delegate to customize the search bar
//     delegate: CustomSearchDelegate());
//     },
//     icon: const Icon(Icons.search,color: Colors.grey),
//     ),
//     IconButton(
//     onPressed: () {
//     Navigator.of(context).push(
//     MaterialPageRoute(
//     builder: (context) => noti(),
//     ),
//     );
//     },
//     icon: const Icon(Icons.notifications_none,color:Colors.grey),
//     ),
//     ],
//     );
//   }
// }

import 'dart:io';

import 'package:ecom/Notification.dart';
import 'package:ecom/search.dart';
import 'package:ecom/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecom/horizontal_list.dart';


class customappbar extends StatefulWidget implements PreferredSizeWidget {
  const customappbar({Key? key}) : super(key: key);

  @override
  State<customappbar> createState() => _customappbarState();

  @override
  Size get preferredSize => Size.fromHeight(90);
}

class _customappbarState extends State<customappbar> {

  File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      toolbarHeight: 90,
      leading: Builder(
          builder: (context) => Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  icon: ImageIcon(AssetImage("assets/images/Bottom/dr.png")),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              )),
      title: Image.asset(
        'assets/images/image_elite.png',
        height: 55,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 1, left: 2),
          child: IconButton(
              onPressed: getImage,
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
              )),
        ),
        IconButton(
          onPressed: () {
            // method to show the search bar
            // showSearch(
            //     context: context,
            //     // delegate to customize the search bar
            //     delegate: CustomSearchDelegate());
            Get.to(SearchView());
          },
          icon: const Icon(Icons.search, color: Colors.grey),
        ),
        IconButton(
          onPressed: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>  noti(),
            //     ));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => noti(),
              ),
            );
          },
          icon: const Icon(Icons.notifications_none, color: Colors.grey),
        ),
      ],

      
    );
  }
}
