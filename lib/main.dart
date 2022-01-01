import 'package:flutter/material.dart';
import 'package:useing_api/src/api/apiscreen.dart';

import 'src/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/apidataS': (context) => apiscreen(),
      },
    );
  }
}
