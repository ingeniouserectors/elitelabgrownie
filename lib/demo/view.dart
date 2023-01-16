// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class webcon extends StatefulWidget {
//   const webcon({Key? key}) : super(key: key);
//
//   @override
//   State<webcon> createState() => _webconState();
// }
//
// class _webconState extends State<webcon> {
//   bool isLoading=true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//           title: Text("hhh",style: TextStyle(fontWeight: FontWeight.w700)),centerTitle: true
//       ),
//       body: Stack(
//         children: <Widget>[
//           WebView(
//             initialUrl: 'https://www.youtube.com/',
//             javascriptMode: JavascriptMode.unrestricted,
//             onPageFinished: (finish) {
//               setState(() {
//                 isLoading = false;
//               });
//             },
//           ),
//           isLoading ? Center( child: CircularProgressIndicator(),)
//               : Stack(),
//         ],
//       ),
//     );
//   }
// }
