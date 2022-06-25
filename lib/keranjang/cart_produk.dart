import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi/controllers/cart_controller.dart';

import '../produk/produk_model.dart';

class CartProduks extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  CartProduks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.produks.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProdukCard(
                controller: controller,
                produk: controller.produks.keys.toList()[index],
                quantity: controller.produks.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProdukCard extends StatelessWidget {
  final CartController controller;
  final Produk produk;
  final int quantity;
  final int index;

  const CartProdukCard({
    Key? key,
    required this.controller,
    required this.produk,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(produk.imageUrl),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(produk.nama),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduk(produk);
            },
            icon: Icon(Icons.remove_circle_outline_outlined),
          ),
          Text('${quantity}'),
          IconButton(
            onPressed: () {
              controller.addProduk(produk);
            },
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
    );
  }
}
