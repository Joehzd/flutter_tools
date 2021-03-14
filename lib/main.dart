import 'package:flutter/material.dart';
import 'package:untitled/TrainingScreen.dart';

import 'SkinSource.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tools',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => TrainingScreen(),
        '/skin': (context) => SkinSource(),
      },
    );
  }
}
