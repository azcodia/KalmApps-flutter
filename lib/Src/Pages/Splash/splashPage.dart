import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kalm/Src/Services/authServices.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final AuthServices authServices = AuthServices();
  
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      authServices.currentUser().then((value) {
        try{
          print("STATUS CURRENT USER");
          print(value);
          if(value == null) {
            Navigator.of(context).pushNamedAndRemoveUntil('/loginPage', (Route<dynamic> route) => false);
          }else {
            Navigator.of(context).pushNamedAndRemoveUntil('/homePage', (Route<dynamic> route) => false); 
          }
        }on PlatformException catch(e) {
          print("ERROR CURRENT USER");
          print(e);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}