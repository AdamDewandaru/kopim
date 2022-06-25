import 'dart:ui';

import 'package:flutter/material.dart';

class detailproduk extends StatefulWidget {
  detailproduk({Key? key}) : super(key: key);

  @override
  State<detailproduk> createState() => _detailproduk();
}

class _detailproduk extends State<detailproduk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                        image: AssetImage('assets/eskopi.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 500,
                    // margin: const EdgeInsets.only(left: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 10, bottom: 8, top: 8),
                              child: const Text(
                                'Cappucino',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 8, top: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Rp 60.000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                InkWell(
                                  // onTap: _minus,
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 36,
                                  ),
                                ),
                                // const Text(
                                //   'Stock: 10',
                                //   style: TextStyle(
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 20),
                                // ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(right: 10, left: 10, top: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi Produk',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Kopi Cappuccino adalah minuman khas Italia yang terdiri dari 1/3 espresso, 1/3 susu steamed, dan 1/3 buih susu. Pada dasarnya, minuman ini adalah campuran dari espresso dan susu seperti minuman-minuman berbasis espresso lainnya. Sepintas, sajian cappuccino hampir tampak serupa dengan minuman latte.',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            InkWell(
                              // onTap: _minus,
                              child: Icon(
                                Icons.message_outlined,
                                size: 20,
                              ),
                            ),

                            //     // // SizedBox(width: 20),
                            //     // // Text(
                            //     // //   '${i}',

                            //     // // ),
                            //     // SizedBox(width: 20),
                            //     // InkWell(
                            //     //   // onTap: _plus,
                            //     //   child: Icon(
                            //     //     Icons.add,
                            //     //     size: 20,
                            //     //   ),
                            //     // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // margin:  EdgeInsets.only(left: 100, bottom: 80),
                  height: 40,
                  width: 100.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(217, 244, 242, 240),
                      onPrimary: Color.fromARGB(255, 10, 4, 4),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // minimumSize: Size(50, 40), //////// HERE
                    ),
                    onPressed: () {},
                    child: Text(
                      '+ Keranjang',
                    ),
                  ),
                ),
                SizedBox(
                  // margin:  EdgeInsets.only(left: 100, bottom: 80),
                  height: 40,
                  width: 100.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(217, 215, 152, 57),
                      onPrimary: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // minimumSize: Size(50, 40), //////// HERE
                    ),
                    onPressed: () {},
                    child: Text('Beli'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
