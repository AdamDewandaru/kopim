import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopi/produk/produk_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Produk>> getAllProduks() {
    return _firebaseFirestore.collection('produks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Produk.fromSnapshot(doc)).toList();
    });
  }
}
