import 'package:get/get.dart';

import '../produk/produk_model.dart';

class CartController extends GetxController {
  var _produks = {}.obs;

  void addProduk(Produk produk) {
    if (_produks.containsKey(produk)) {
      _produks[produk] += 1;
    } else {
      _produks[produk] = 1;
    }

    Get.snackbar(
      'Produk di tambahkan',
      'Anda menambahkan ${produk.nama} ke keranjang',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduk(Produk produk) {
    if (_produks.containsKey(produk) && _produks[produk] == 1) {
      _produks.removeWhere((key, value) => key == produk);
    } else {
      _produks[produk] -= 1;
    }
  }

  get produks => _produks;

  get produkSubtotal => _produks.entries
      .map((produk) => produk.key.harga * produk.value)
      .toList();

  get total => _produks.entries
      .map((produk) => produk.key.harga * produk.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
