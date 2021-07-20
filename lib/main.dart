import 'package:emotion_detection/predict_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "montserrat",
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.indigo.shade300
        )
      ),
      home: const PredictPage(),
    );
  }
}
