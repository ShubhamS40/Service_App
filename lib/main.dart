import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:serviceapp/home.dart';
import 'package:serviceapp/otp.dart';
import 'package:serviceapp/phoneauth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String shubham="oj";
  String shubha="lo";
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // theme: ThemeData(
      //   textTheme: TextTheme(
      //     bodySmall: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold

      //     ),
      //     bodyText2: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600
      //     ),
      //     bodyText1: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.w900
      //     )
      //   )
      // ),
      home: MyWidget(),
    );
  }
}
