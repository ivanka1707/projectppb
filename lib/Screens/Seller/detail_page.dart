import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
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
        children: [Image.asset("")],
      ),
    );
  }
}
