import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopi/Home.dart';
import 'package:kopi/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(239, 232, 138, 6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // width: 100,
                  // height: 100,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/coffee.png'),
                        fit: BoxFit.fill),
                  )
                  // child: Image(image: AssetImage("assets/images/Logo.png")),
                  ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 239, 235),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    height: 40,
                    width: 270,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller1,
                    ),
                    // child: TextField(image: AssetImage("assets/images/profil.png")),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 247, 246),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    height: 40,
                    width: 270,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller2,
                    ),
                    // child: TextField(image: AssetImage("assets/images/profil.png")),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: LOGIN,
                      child: Text('Login',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return MyWidget();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Buat Akun',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void LOGIN() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: controller1.text.trim(), password: controller2.text.trim())
          .then((uid) => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }))
              });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
