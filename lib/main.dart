import 'package:flutter/material.dart';
import 'package:minor_project/Account.dart';
import 'package:minor_project/Register.dart';
import 'package:minor_project/Start.dart';
import 'package:minor_project/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minor_project/HomePage.dart';
import 'package:minor_project/Address.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "Register":(BuildContext context)=>Register(),
        "Start":(BuildContext context)=>Start(),
        "Account":(BuildContext context)=>Account(),
        "Address":(BuildContext context)=>Address(),
      },
    );
  }
}
