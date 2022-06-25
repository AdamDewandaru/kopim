import 'package:cloud_firestore/cloud_firestore.dart';

class Produk {
  final String nama;
  final int harga;
  final String imageUrl;

  const Produk({
    required this.nama,
    required this.harga,
    required this.imageUrl,
  });

  static Produk fromSnapshot(DocumentSnapshot snap) {
    Produk produks = Produk(
      nama: snap['nama'],
      harga: snap['harga'],
      imageUrl: snap['imageUrl'],
    );
    return produks;
  }

  // static const List<Produk> produks = [
  //   Produk(
  //       nama: 'Cappucino',
  //       harga: 60,
  //       imageUrl:
  //           'https://fdid.imgix.net/prod/cappucino-cincau-mHhu2k0xf1.jpg'),
  //   Produk(
  //       nama: 'Latte',
  //       harga: 55,
  //       imageUrl:
  //           'https://firebasestorage.googleapis.com/v0/b/login-kopi.appspot.com/o/eskopi2.jpg?alt=media&token=962df6b1-cc1d-4a71-ad94-ede8d8235c1a'),
  //   Produk(
  //       nama: 'Espresso',
  //       harga: 50,
  //       imageUrl:
  //           'https://firebasestorage.googleapis.com/v0/b/login-kopi.appspot.com/o/eskopii3.jpg?alt=media&token=3b2573cd-6f9b-413f-9934-b553f3f72872'),
  //   Produk(
  //       nama: 'Americano',
  //       harga: 45,
  //       imageUrl:
  //           'https://firebasestorage.googleapis.com/v0/b/login-kopi.appspot.com/o/eskopi.jpg?alt=media&token=cd287bd9-4569-46cb-a899-1c38e9edba3c'),
  // ];
}
