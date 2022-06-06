import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const/const.dart';
import 'package:flutter_dashboard/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Const.purpleDark,
        canvasColor: Const.purpleLight,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


