import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> _products = []; // List untuk menyimpan produk

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  // Anda bisa menambahkan kontroler untuk gambar jika diperlukan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_products[index]['nama']),
            subtitle: Text('Stok: ${_products[index]['stok']}'),
            onTap: () {
              _showEditProductDialog(_products[index], index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Produk Baru'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Produk'),
                ),
                TextFormField(
                  controller: _deskripsiController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextFormField(
                  controller: _hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Harga'),
                ),
                TextFormField(
                  controller: _stokController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Stok'),
                ),
                // Widget untuk gambar produk (jika diperlukan)
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _addProduct();
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showEditProductDialog(Map<String, dynamic> product, int index) {
    // Logika untuk menampilkan dialog edit produk
  }

  void _addProduct() {
    // Logika untuk menambah produk ke dalam list _products
    String nama = _namaController.text;
    String deskripsi = _deskripsiController.text;
    double harga = double.tryParse(_hargaController.text) ?? 0.0;
    int stok = int.tryParse(_stokController.text) ?? 0;

    Map<String, dynamic> newProduct = {
      'nama': nama,
      'deskripsi': deskripsi,
      'harga': harga,
      'stok': stok,
      // Tambahkan properti lain jika diperlukan
    };

    setState(() {
      _products.add(newProduct);
    });

    _clearTextFields();
  }

  void _clearTextFields() {
    _namaController.clear();
    _deskripsiController.clear();
    _hargaController.clear();
    _stokController.clear();
  }
}
