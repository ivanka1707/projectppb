import 'package:flutter/material.dart';
import 'package:projectppb/Database/repository.dart';
import 'package:projectppb/Models/produks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RepositoryProduk repo = RepositoryProduk();
  List<Produk> _list = [];

  @override
  Widget build(BuildContext context) {
    _list = repo.list;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFDC0000),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(-10.0),
          child: Container(
            height: 4,
            color: const Color(0xFFDC0000).withOpacity(0.2),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: const Color(0xFFDC0000),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Baterai"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Monitor"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Perlengkapan Rumah"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Komputer & Aksesoris Lainnya"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Handphone"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Perangkat Audio & Speaker"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: _list.length,
                  itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        semanticContainer: true,
                        margin: const EdgeInsets.all(5),
                        shadowColor: Colors.blueGrey,
                        elevation: 4,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    _list[index].gambar,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _list[index].nama,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _list[index].harga.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
      ),
    );
  }
}
