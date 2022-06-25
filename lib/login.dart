// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:kopi/Home.dart';
// import 'package:kopi/signup.dart';


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _rememberMe = false;

//   get kBoxDecorationStyle => null;

//   get kHintTextStyle => null;
//   Widget _buildEmailTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text('Email'),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Masukkan Email ',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text('Password'),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             obscureText: true,
//             // keyboardType: TextInputType.PasswordAddress,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               hintText: 'Masukkan Password ',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildLupaPassword() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: ElevatedButton(
//         onPressed: () => print('lupa kunci password'),
//         child: Text('Lupa Password?'),
//         // padding: EdgeInsets.only(right: 0.0),
//       ),
//     );
//   }

//   Widget _buildRememberMeCheckBox() {
//     return Container(
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(unselectedWidgetColor: Colors.white),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.green,
//               activeColor: Colors.white,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value!;
//                 });
//               },
//             ),
//           ),
//           Text('Remember Me'),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoginbtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Home()));
//         },
//         child: Text(
//           'LOGIN',
//           style: TextStyle(
//             color: Color.fromARGB(255, 129, 93, 2),
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'OpenSans',
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSigninwith() {
//     return Column(
//       children: <Widget>[
//         Text(
//           '- OR -',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
//         ),
//         SizedBox(height: 20.0),
//         Text(
//           'Sign in with',
//           style: TextStyle(color: Colors.white),
//         ),
//       ],
//     );
//   }

//   Widget _buildsocialbtn() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 30.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           GestureDetector(
//             onTap: () => print('Login with Facebook'),
//             child: Container(
//               height: 60.0,
//               width: 60.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0, 2),
//                     blurRadius: 6.0,
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: AssetImage('assets/fb.png'),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => print('Login with Google'),
//             child: Container(
//               height: 60.0,
//               width: 60.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0, 2),
//                     blurRadius: 6.0,
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: AssetImage('assets/google.jfif'),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSignupbtn() {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => MyWidget()));
//       },
//       child: RichText(
//         text: TextSpan(children: [
//           TextSpan(
//               text: 'Don\'t have an Account?   ',
//               style: TextStyle(fontWeight: FontWeight.w400)),
//           TextSpan(
//             text: 'Sign Up',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ]),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controlEmail = TextEditingController();
//     final controlPassword = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//         backgroundColor: Color.fromARGB(255, 241, 165, 50),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromARGB(255, 239, 155, 81),
//                   Color.fromARGB(255, 189, 144, 32),
//                   Color.fromARGB(255, 239, 157, 15),
//                   Color.fromARGB(255, 203, 139, 11),
//                 ],
//                 stops: [0.1, 0.4, 0.7, 0.9],
//               ),
//             ),
//           ),
//           Container(
//               height: double.infinity,
//               child: SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 40.0,
//                   vertical: 120.0,
//                 ),
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Sign In',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 30.0),
                    
//                     SizedBox(
//                       height: 30.0,
//                     ),
//                     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text('Email'),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             controller: controlEmail,
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Masukkan Email ',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         )
//       ],
//     ),
//                   Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text('Password'),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             controller: controlPassword,
//             obscureText: true,
//             // keyboardType: TextInputType.PasswordAddress,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               hintText: 'Masukkan Password ',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         )
//       ],
//     ),
                    
//                     _buildLupaPassword(),
//                     _buildRememberMeCheckBox(),
//                     _buildLoginbtn(),
//                     _buildSigninwith(),
//                     _buildsocialbtn(),
//                     _buildSignupbtn(),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
    
//   }
//   void Login() async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: controlEmail.text.trim(), password: controlPassword.text.trim())
//           .then((uid) => {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Home();
//                 }))
//               });
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//   }
// }

