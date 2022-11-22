import 'package:flutter/material.dart';

import 'components/home_page.dart';

void main() {
  runApp(const AppImc());
}

class AppImc extends StatefulWidget {
  const AppImc({super.key});

  @override
  State<AppImc> createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Imc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        backgroundColor: Colors.white38,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
          headline2: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          headline3: TextStyle(
            fontSize: 26,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            color: Colors.white70,
          ),
          bodyText1: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
            color: Colors.lightGreen,
            decorationColor: Colors.amber,
            fontWeight: FontWeight.w900,
          ),
          bodyText2: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ),
      home: const Home_Page(),
    );
  }
}
