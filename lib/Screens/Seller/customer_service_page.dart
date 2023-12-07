import 'package:flutter/material.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  _CustomerServicePageState createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  final List<Map<String, dynamic>> _messages = [
    // Contoh data pesan
    {
      'sender': 'Pembeli',
      'message': 'Apakah produk ini tersedia dalam ukuran XL?',
      'timestamp': DateTime.now(),
    },
    {
      'sender': 'Penjual',
      'message': 'Maaf, saat ini ukuran XL sudah habis. Namun kami memiliki ukuran lainnya.',
      'timestamp': DateTime.now().add(const Duration(minutes: 5)),
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan Pelanggan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index]['sender'] == 'Penjual' ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _messages[index]['sender'] == 'Penjual' ? Colors.blueGrey : Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _messages[index]['message'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${_messages[index]['timestamp'].hour.toString().padLeft(2, '0')}:${_messages[index]['timestamp'].minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(labelText: 'Ketik pesan...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'Penjual', // Ganti ke 'Pembeli' jika pengguna adalah pembeli
          'message': messageText,
          'timestamp': DateTime.now(),
        });
        _messageController.clear();
      });
    }
  }
}
