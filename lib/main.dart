
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/webview/videoplayer.dart';
import 'package:ecom/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'dummy/dummyDiamond.dart';
import 'dummy/zoomin_out.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    DbProvider.load().whenComplete(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(),
          ),
        ],
        child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomePage(),
     // home:ExamplePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
