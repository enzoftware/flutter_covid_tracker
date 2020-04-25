import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/ui/screens/home_screen.dart';
import 'package:flutter_covid_tracker/ui/widgets/error_screen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(child: ErrorScreen());
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepOrange,
      ),
      home: HomeScreen(),
    );
  }
}
