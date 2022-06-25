import 'package:flutter/material.dart';
import 'package:kopi/profil/body_profil.dart';

class profil_page extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Profile"),
      ),
      body: body_profil(),
    );
  }
}
