import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/views/addpage/add_screens.dart';
import 'package:todoapp/views/homepage/landing_screen.dart';
import 'package:todoapp/views/loginpage/authview.dart';
import 'package:todoapp/views/loginpage/login.dart';
import 'package:todoapp/views/splashscreen/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter todo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple
      ),
      initialRoute: "/",
      routes: {
        "/":(contetx) => AuthView(),
        "/loginpage":(contetx) => LoginPage(),
        "/landingScreen":(context)  => LandingScreen(),
        "/addscreen":(context)  => AddScreen()
      },

    );
  }
}

