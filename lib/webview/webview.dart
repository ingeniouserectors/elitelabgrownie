// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class Webviewload extends StatefulWidget {
//   String? htmllink;
//   @override
//   State<Webviewload> createState() => _WebviewloadState();
// }
//
// class _WebviewloadState extends State<Webviewload> {
//   bool isLoading=true;
//   WebViewController controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//   NavigationDelegate(
//   onProgress: (int progress) {
//   // Update loading bar.
//   },
//   onPageStarted: (String url) {},
//   onPageFinished: (finish) {
//      isLoading = false;
//   },
//   onWebResourceError: (WebResourceError error) {},
//   onNavigationRequest: (NavigationRequest request) {
//   if (request.url.startsWith('https://s3.amazonaws.com/lgdvideos/10000070415.html')) {
//   return NavigationDecision.prevent;
//   }
//   return NavigationDecision.navigate;
//   },
//   ),
//   )
//   ..loadRequest(Uri.parse('https://s3.amazonaws.com/lgdvideos/10000070415.html'));
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return
//       (controller == "")?
//       Center(
//           child: Container(
//               height: 60.0,
//               width: double.infinity,
//               alignment: Alignment.center,
//               child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json'))):
//       WebViewWidget(
//               controller: controller,
//
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webcon extends StatefulWidget {

   var uri;

   webcon({required this.uri}); // const webcon({Key? key}) : super(key: key);

  @override
  State<webcon> createState() => _webconState();
}

class _webconState extends State<webcon> {
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Stack(
            children: [
              SizedBox(
                height: 50,
              ),
               Container(
                 child: Transform.scale(
                   scale: 1.40,
                   child: Container(
                     child: Padding(
                       padding: const EdgeInsets.only(top: 50),
                       child: WebView(
                          initialUrl: widget.uri,
                          javascriptMode: JavascriptMode.unrestricted,
                          onPageFinished: (finish) {
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                     ),
                   ),
                 ),
               ),
              IconButton(onPressed: (){
                showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: Container(
                        child: Stack(
                          children: [
                            WebView(
                              initialUrl: widget.uri,
                              javascriptMode: JavascriptMode.unrestricted,
                              onPageFinished: (finish) {
                                setState(() {
                                  isLoading = false;
                                });
                              },
                            ),
                            // isLoading ?  Center(
                            //     child: Container(
                            //         height: 60.0,
                            //         width: double.infinity,
                            //         alignment: Alignment.center,
                            //         child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')))
                            //     : Stack(),
                          ],
                        ),
                      ),
                    ));


              }, icon: Icon(Icons.remove_red_eye_outlined,size: 30,)),
              isLoading ?  Center(
              child: Container(
                  height: 60.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')))
                  : Stack(),
            ],
          ),
      ),
    );
    // return
    // Stack(
    //     children: [
    //        WebView(
    //
    //           initialUrl: widget.uri,
    //           javascriptMode: JavascriptMode.unrestricted,
    //           onPageFinished: (finish) {
    //             setState(() {
    //               isLoading = false;
    //             });
    //           },
    //         ),
    //       IconButton(onPressed: (){
    //         showDialog(
    //             context: context,
    //             builder: (_) => Dialog(
    //               child: Container(
    //                 child: Stack(
    //                   children: [
    //                     WebView(
    //                       initialUrl: widget.uri,
    //                       javascriptMode: JavascriptMode.unrestricted,
    //                       onPageFinished: (finish) {
    //                         setState(() {
    //                           isLoading = false;
    //                         });
    //                       },
    //                     ),
    //                     // isLoading ?  Center(
    //                     //     child: Container(
    //                     //         height: 60.0,
    //                     //         width: double.infinity,
    //                     //         alignment: Alignment.center,
    //                     //         child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')))
    //                     //     : Stack(),
    //                   ],
    //                 ),
    //               ),
    //             ));
    //
    //
    //       }, icon: Icon(Icons.remove_red_eye_outlined,size: 30,)),
    //       isLoading ?  Center(
    //       child: Container(
    //           height: 60.0,
    //           width: double.infinity,
    //           alignment: Alignment.center,
    //           child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')))
    //           : Stack(),
    //     ],
    //   );
  }
}
