import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';
import 'package:fit_gym/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('FitGym');
    setWindowMinSize(const Size(700, 500));
    setWindowMaxSize(Size.infinite);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
