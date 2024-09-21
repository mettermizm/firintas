import 'package:firintas/denemeler/den2.dart';
import 'package:firintas/membership/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fırıntaş',
      theme: ThemeData.light(),
      home: DENNO(),
    );
  }
}
