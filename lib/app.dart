import 'package:flt_p/landing/landing.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Landing.routename: (context) => Landing(),
      },
    );
  }
}
