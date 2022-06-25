import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi/controllers/cart_controller.dart';
import 'package:kopi/controllers/produk_controller.dart';

class CatalogProduks extends StatelessWidget {
  final produkController = Get.put(ProdukController());

  CatalogProduks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: produkController.produks.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProdukCard(index: index);
            }),
      ),
    );
  }
}

class CatalogProdukCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProdukController produkController = Get.find();
  final int index;

  CatalogProdukCard({
    Key? key,
    required this.index,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              produkController.produks[index].imageUrl,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              produkController.produks[index].nama,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: Text('${produkController.produks[index].harga}'),
          ),
          IconButton(
            onPressed: () {
              cartController.addProduk(produkController.produks[index]);
            },
            icon: Icon(
              Icons.add_circle_outline,
            ),
          ),
        ],
      ),
    );
  }
}
