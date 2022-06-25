import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi/Home.dart';
import 'package:kopi/keranjang/cart_produk.dart';
import 'package:kopi/keranjang/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text('Kerajang'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          CartProduks(),
          CartTotal(),
          ElevatedButton(
            onPressed: () => Get.to(() => Home()),
            child: Text('Pesan'),
          ),
        ],
      ),
    );
  }
}
