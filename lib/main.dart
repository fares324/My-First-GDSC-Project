
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AnimatedList.dart';
import 'package:flutter_application_1/Login_Screen_GDSC.dart';
import 'package:flutter_application_1/RegisterScreen_GDSC.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home:const Login_Screen(),
    );
  }
}

