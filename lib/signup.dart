import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopi/user_database.dart';
import 'Home.dart';
import 'login2.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

var kHintTextStyle;

get kBoxDecorationStyle => null;

class _MyWidgetState extends State<MyWidget> {
  final controlFullname = TextEditingController();
  final controlPhoneNumber = TextEditingController();
  final controlEmail = TextEditingController();
  final controlPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 232, 138, 6),
      body: Stack(
        children: <Widget>[
          // Container(

          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       // colors: [
          //       //   Color.fromARGB(239, 232, 138, 6),
          //       //   Color.fromARGB(171, 210, 132, 23),
          //       // ],
          //       stops: [0.1, 0.4, 0.7, 0.9],
          //     ),
          //   ),
          // ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nama'),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            controller: controlFullname,
                            // obscureText: true,
                            // keyboardType: TextInputType.PasswordAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: 'Nama ',
                              // hintStyle: kHintTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Email'),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            controller: controlEmail,
                            // obscureText: true,
                            // keyboardType: TextInputType.PasswordAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Email ',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('No Hp'),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            controller: controlPhoneNumber,
                            // obscureText: true,
                            // keyboardType: TextInputType.PasswordAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'No Hp ',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Password'),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            controller: controlPassword,
                            // obscureText: true,
                            // keyboardType: TextInputType.PasswordAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Password ',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: CreateUser,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 129, 93, 2),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  // void Signup() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: controlEmail.text.trim(),
  //             password: controlPassword.text.trim())
  //         .then((uid) => {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) {
  //                     return Home();
  //                   },
  //                 ),
  //               ),
  //             });
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }
  void CreateUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: controlEmail.text.trim(),
              password: controlPassword.text.trim())
          .then((uid) => {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Login();
                }))
              });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    final data = Data(
        Nama: controlFullname.text,
        NomerHP: int.parse(controlPhoneNumber.text),
        Email: controlEmail.text,
        Password: controlPassword.text);
    createData(data);
  }
}

Future createData(Data data) async {
  final docData = FirebaseFirestore.instance.collection("User").doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);
}
