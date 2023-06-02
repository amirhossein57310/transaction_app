import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:transaction_app/ui/second_screen.dart';
import 'package:transaction_app/widget/chart_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'osb',
        ),
        debugShowCheckedModeBanner: false,
        home: SecondScreen());
  }
}
