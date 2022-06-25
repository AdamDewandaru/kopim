import 'package:flutter/material.dart';
import 'package:kopi/chat/chat.dart';
import 'package:kopi/detail_produk.dart';
import 'package:kopi/keranjang/katalog_produk.dart';
import 'package:kopi/keranjang/main_cart.dart';
import 'package:kopi/keranjang/screens.dart/cart_screen.dart';
import 'package:kopi/profil_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "cappucino",
      "img": 'assets/eskopi.jpg',
      "page": '/kopi',
    },
    {
      "id": 2,
      "name": "latte",
      "img": 'assets/eskopi2.jpg',
      "page": '/kopi',
    },
    {
      "id": 3,
      "name": "espresso",
      "img": 'assets/eskopii3.jpg',
      "page": '/kopi',
    },
    {
      "id": 4,
      "name": "americano",
      "img": 'assets/eskopi.jpg',
      "page": '/kopi',
    }
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  int _selectedIndex = 0;

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // Method pengecekan box pencarian
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // Mengubah segala inputan menjadi lowercase
    }

    setState(() {
      _foundUsers = results;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => main_cart()),
                );
              },
              icon: Icon(Icons.book_outlined),
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => chatscreen()),
          //           );
          //         },
          //         icon: Icon(Icons.message))),
        ],
        title: Container(
          width: 300,
          height: 37,
          child: Center(
            child: TextField(
              onChanged: (value) => _runFilter(value),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.only(bottom: -10.0, left: 10.0),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.search),
                hintText: 'Americano',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 184, 142, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/poster.jpg'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Wrap(
                                    spacing: 10.0,
                                    runSpacing: 20.0,
                                    children: [
                                      Container(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        detailproduk()));
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 2.5),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 130,
                                                  height: 110,
                                                  margin:
                                                      EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          new BorderRadius.only(
                                                        topLeft: const Radius
                                                            .circular(10.0),
                                                        topRight: const Radius
                                                            .circular(10.0),
                                                      ),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              _foundUsers[index]
                                                                  ['img']))),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15.0),
                                                  width: 130,
                                                  height: 40,
                                                  decoration: new BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 135, 102, 32),
                                                      borderRadius:
                                                          new BorderRadius.only(
                                                        bottomLeft: const Radius
                                                            .circular(10.0),
                                                        bottomRight:
                                                            const Radius
                                                                .circular(10.0),
                                                      )),
                                                  child: Center(
                                                    child: Text(
                                                      _foundUsers[index]
                                                          ['name'],
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'tidak ditemukan',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return CartScreen();
                  }));
                }),
            label: 'Keranjang',
            backgroundColor: Color.fromARGB(255, 248, 247, 247),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.message_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return chatpage();
                  }));
                }),
            label: 'Pesan',
            backgroundColor: Color.fromARGB(255, 248, 247, 247),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return profil_page();
                  }));
                }),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 247, 248, 247),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
