import 'package:flutter/material.dart';

class OrderManagementPage extends StatefulWidget {
  const OrderManagementPage({super.key});

  @override
  _OrderManagementPageState createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  final List<Map<String, dynamic>> _orders = [
    {
      'id': '1',
      'namaPembeli': 'John Doe',
      'produk': 'Kaos Polos',
      'jumlah': 2,
      'alamat': 'Jl. Raya No. 123',
      'status': 'Dalam Proses',
    },
    // Menambahkan data pesanan lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Pesanan'),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_orders[index]['namaPembeli']),
            subtitle: Text('Status: ${_orders[index]['status']}'),
            onTap: () {
              _showOrderDetails(_orders[index]);
            },
          );
        },
      ),
    );
  }

  void _showOrderDetails(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Detail Pesanan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nama Pembeli: ${order['namaPembeli']}'),
                Text('Produk: ${order['produk']}'),
                Text('Jumlah: ${order['jumlah']}'),
                Text('Alamat Pengiriman: ${order['alamat']}'),
                // Menampilkan informasi pesanan lainnya jika ada
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: order['status'],
                  items: ['Dalam Proses', 'Dikirim', 'Selesai']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      order['status'] = newValue!;
                      if (newValue == 'Selesai') {
                        _removeOrder(order);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tutup'),
            ),
            TextButton(
              onPressed: () {
                // Logika untuk menyimpan perubahan status pesanan
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _removeOrder(Map<String, dynamic> order) {
    setState(() {
      _orders.remove(order);
    });
  }
}
