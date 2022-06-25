import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopi/location/maps.dart';
import 'package:kopi/profil/tentang_kami.dart';
import 'package:kopi/profil/userprofil.dart';
import '../login2.dart';

import 'menu_profil.dart';

class body_profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          userprofil(),
          menu_profil(
            text: "Riwayat saya",
            press: () => {},
          ),
          menu_profil(
            text: "Privasi dan Keamanan",
            press: () => {},
          ),
          menu_profil(
            text: "Favorite Saya",
            press: () => {},
          ),
          menu_profil(
            text: "Lokasi Anda",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return Maps();
              }))
            },
          ),
          menu_profil(
            text: "Tentang Kami",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return tentangkami();
              }))
            },
          ),
          menu_profil(
            text: "Keluar",
            press: () => {logout(context)},
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
}
