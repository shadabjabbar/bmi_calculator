import 'package:flutter/material.dart';
import './input_page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF0A0D22),//Color(0xFF1D1E3),// navigation bar color
     // status bar color
    statusBarColor: Color(0xFF0A0D22),

  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        accentColor: Color(0xFFEB1555),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
        cardColor: Color(0xFF1D1E33),
      ),
      home: InputPage(),
    );
  }
}
