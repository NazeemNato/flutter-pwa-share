import 'package:flutter/material.dart';
import 'homeScreen.dart';

class MyWeb extends StatelessWidget {
  const MyWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share PWA',
      home: HomeScreen()
    );
  }
}
