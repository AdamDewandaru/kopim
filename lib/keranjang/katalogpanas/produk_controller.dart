import 'package:get/get.dart';
import 'package:kopi/produk/produk_model.dart';
import 'package:kopi/service/firestore_db.dart';

class ProdukController extends GetxController {
  final produks = <Produk>[].obs;

  @override
  void onInit() {
    produks.bindStream(FirestoreDB().getAllProduks());
    super.onInit();
  }
}
