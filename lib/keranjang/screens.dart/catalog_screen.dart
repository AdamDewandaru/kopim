import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi/keranjang/cart_produk.dart';
import 'package:kopi/keranjang/katalog_produk.dart';
import 'package:kopi/keranjang/screens.dart/cart_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Katalog")),
      body: SafeArea(
        child: Column(
          children: [
            CatalogProduks(),
            ElevatedButton(
              onPressed: () => Get.to(() => CartScreen()),
              child: Text('Ke kerenjang'),
            ),
          ],
        ),
      ),
    );
  }
}
