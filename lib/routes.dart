import 'package:flutter/material.dart';
import 'package:kalm/Src/Pages/Auth/Login/loginPage.dart';
import 'package:kalm/Src/Pages/Home/homePage.dart';
import 'package:kalm/Src/Pages/Splash/splashPage.dart';

final routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => SplashPage(),
  '/loginPage': (BuildContext context) => LoginPage(),
  '/homePage': (BuildContext context) => HomePage(),
};