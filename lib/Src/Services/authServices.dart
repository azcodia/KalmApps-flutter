import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var result;

  // SIGN IN
  Future<FirebaseUser> signIn(String _email, String _password) async {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email:_email,password:_password
      )).user;
      print("USER :");
      print(user);
      return result;
  }

  // CEK USER
  Future<FirebaseUser> currentUser() async{
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  // SignOut
  Future<void> signOut() async{
    return _auth.signOut();
  }

}