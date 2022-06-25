import 'package:flutter/material.dart';
import "body_profil.dart";

class menu_profil extends StatelessWidget {
  menu_profil({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(30),
            backgroundColor: Colors.white,
          ),
          onPressed: press,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(child: Text(text))
            ],
          )),
    );
  }
}
