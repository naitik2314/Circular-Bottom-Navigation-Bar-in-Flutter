import 'package:circularbottombar/screens/cbn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This Widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(
        title: 'Circular Bottom Navigation Bar',
      ),
    );
  }
}
