import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalm/Src/Services/authServices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthServices authServices = AuthServices();

  LogOutAuth() {
    authServices.signOut().then((value) {
      try{
        print("BERHASIL LOGOUT");
        Navigator.of(context).pushNamedAndRemoveUntil('/loginPage', (Route<dynamic> route) => false);
      }on PlatformException catch(e) {
        print("ERROR LOGOUT");
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.amber,
          onPressed: LogOutAuth,
          child: Text("LogOut"),
        ),
      ),
    );
  }
}