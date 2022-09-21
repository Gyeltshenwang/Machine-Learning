//import 'package:classification/ImgSlider.dart';
import 'package:classification/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kewa Doctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //primarySwatch: Colors.amber,

          ),
      home: HomePage(),
    );
  }
}
