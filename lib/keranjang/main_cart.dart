import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi/keranjang/screens.dart/catalog_screen.dart';
import 'package:kopi/main.dart';
import 'katalog_produk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'katalog_produk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: main_cart(),
  ));
}

class main_cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CatalogScreen(),
    );
  }
}
