import 'package:flutter/material.dart';
import 'package:sic/view/introPage.dart';
import 'package:sic/view/loginAndSignupPage.dart';
import 'package:sic/view/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.orange 
      ),
      home: MySplashScreen(),
      routes: <String, WidgetBuilder>{
        '/sic/view/loginView' : (BuildContext context) => new LoginView(),
        '/sic/view/homePage' : (BuildContext context) => new HomePage()
      },
    );
  }
}