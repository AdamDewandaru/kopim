import 'package:flutter/material.dart';
import 'body_profil.dart';

class tentangkami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Tentang Kami'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: Image.asset('assets/coffee.png'),
            width: double.infinity,
          ),
          Container(
            child: Text(
                'Aplikasi Yang Menyediakan kopi siap saji dan diantarkan ke tempat tujuan '),
          ),
        ],
      ),
    );
  }
}
