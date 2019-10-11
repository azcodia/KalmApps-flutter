import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalm/Src/Services/authServices.dart';
import 'package:kalm/Src/Validators/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validators {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();

  String _email, _password;
  bool forgetPassword = false;

  @override
  void initState() {
    super.initState();
    // authServices.currentUser().then((value) {
    //   try{
    //     print("STATUS CURRENT USER");
    //     print(value);
    //   }on PlatformException catch(e) {
    //     print("ERROR CURRENT USER");
    //     print(e);
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  LoginAuth() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(_email);
      print(_password);
      authServices.signIn(_email, _password).then((value) {
        try {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/homePage', (Route<dynamic> route) => false);
        } on PlatformException catch (e) {
          print("ERROR");
          print(e);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/Images/bgLogin.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage('Assets/Images/Logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 40,
                        // height: MediaQuery.of(context).size.width + 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(1, 1),
                                  blurRadius: 3
                                )
                            ]),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 155,
                              width: 155,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                  image: AssetImage('Assets/Images/Avatar.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 25, right: 25),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "Assets/Images/Username.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10,bottom: 10, top: 10),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                160,
                                            // color: Colors.red,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: validateEmail,
                                              onSaved: (val) => _email = val,
                                              style: TextStyle(
                                                fontSize: 16,
                                                // color: Colors.red,
                                              ),
                                              decoration: InputDecoration(
                                                  hintText: "Username",
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'MavenPro',
                                                    fontWeight: FontWeight.w300
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 4),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // PASSWORD
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, left: 25, right: 25),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                // color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "Assets/Images/Password.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, bottom: 10, top: 10),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                160,
                                            // color: Colors.red,
                                            child: TextFormField(
                                              validator: (val) {
                                                if(val.isEmpty) {
                                                  return "Field Tidak Boleh Kosong";
                                                }
                                              },
                                              onSaved: (val) => _password = val,
                                              style: TextStyle(
                                                fontSize: 16,
                                                // color: Colors.red,
                                              ),
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'MavenPro',
                                                    fontWeight: FontWeight.w300
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 4),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 45,
                                        bottom: 10,
                                        top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: forgetPassword,
                                              onChanged: (bool value) {},
                                            ),
                                            Text("Ingatkan", style: TextStyle(
                                              fontFamily: 'MavenPro',
                                              fontWeight: FontWeight.w300
                                            )),
                                          ],
                                        ),
                                        Text("Lupa Password", style: TextStyle(
                                          fontFamily: 'MavenPro',
                                          fontWeight: FontWeight.w600
                                        )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0,
                                        left: 25,
                                        right: 25,
                                        bottom: 10),
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                10,
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: Color(0xffd78b72),
                                          onPressed: LoginAuth,
                                          child: Text("Masuk", style: TextStyle(color: Colors.white, fontFamily: 'MavenPro',fontWeight: FontWeight.w300))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 25),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Belum Punya Akun? ", style: TextStyle(
                                          fontFamily: 'MavenPro',
                                          fontWeight: FontWeight.w300
                                        )),
                                        Text(" "),
                                        Text("DAFTAR", style: TextStyle(
                                          fontFamily: 'MavenPro',
                                          fontWeight: FontWeight.w600
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ))
        );
  }
}
