import 'package:firintas/pages/auth/login.dart';
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
      home: const LoginPage(),
      //const ProductListScreen(),
    );
  }
}
