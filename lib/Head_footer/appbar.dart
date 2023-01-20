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

import 'dart:io' as io;

import 'package:ecom/Notification.dart';
import 'package:ecom/painters/object_detector_painter.dart';
import 'package:ecom/search.dart';
import 'package:ecom/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';


class customappbar extends StatefulWidget implements PreferredSizeWidget {
  const customappbar({Key? key}) : super(key: key);

  @override
  State<customappbar> createState() => _customappbarState();

  @override
  Size get preferredSize => Size.fromHeight(90);
}

class _customappbarState extends State<customappbar> {

  io.File? _image;
  final imagePicker = ImagePicker();

  late ObjectDetector _objectDetector;
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void initState() {
    super.initState();

    _initializeDetector(DetectionMode.single);
  }

  @override
  void dispose() {
    _canProcess = false;
    _objectDetector.close();
    super.dispose();
  }

  void _initializeDetector(DetectionMode mode) async {
    print('Set detector in mode: $mode');

    // uncomment next lines if you want to use the default model
    // final options = ObjectDetectorOptions(
    //     mode: mode,
    //     classifyObjects: true,
    //     multipleObjects: true);
    // _objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a local model
    // make sure to add tflite model to assets/ml
    final path = 'assets/ml/object_labeler.tflite';
    final modelPath = await _getModel(path);
    final options = LocalObjectDetectorOptions(
      mode: mode,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    _objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a remote model
    // make sure to add model to firebase
    // final modelName = 'bird-classifier';
    // final response =
    //     await FirebaseObjectDetectorModelManager().downloadModel(modelName);
    // print('Downloaded: $response');
    // final options = FirebaseObjectDetectorOptions(
    //   mode: mode,
    //   modelName: modelName,
    //   classifyObjects: true,
    //   multipleObjects: true,
    // );
    // _objectDetector = ObjectDetector(options: options);

    _canProcess = true;
  }

  Future getImage() async {
    // final image = await imagePicker.getImage(source: ImageSource.camera);
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    }

    // setState(() {
    //   _image = io.File(image!.path);
    //   final inputImage = InputImage.fromFilePath(image!.path);
    //   processImage(inputImage);
    // });
  }

  Future _processPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = io.File(path);
    });
    // _path = path;
    final inputImage = InputImage.fromFilePath(path);
    processImage(inputImage);
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    // _isBusy = true;
    setState(() {
      _text = '';
    });
    final objects = await _objectDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = ObjectDetectorPainter(
          objects,
          inputImage.inputImageData!.imageRotation,
          inputImage.inputImageData!.size);
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = objects.count != 0 ? "${objects.first.labels.last.text}" : "";
      _text = text;
      print("Final Text ============ >>>>>>>>>>>>>: $_text");
      Get.to(SearchView(objectStr: _text ?? ''));
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {

      });
    }
  }

  Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
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
            Get.to(SearchView(objectStr: ''));
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
