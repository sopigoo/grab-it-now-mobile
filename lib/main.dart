import 'package:flutter/material.dart';
import 'package:grab_it_now/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab It Now!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF789395),
          secondary: const Color(0xFF94B49F),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
