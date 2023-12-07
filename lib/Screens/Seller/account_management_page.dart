import 'package:flutter/material.dart';

class AccountManagementPage extends StatefulWidget {
  const AccountManagementPage({super.key});

  @override
  _AccountManagementPageState createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  final String _username = 'username'; // Nama pengguna
  String _ownerName = 'Nama Pemilik Toko'; // Nama pemilik toko
  String _contact = 'Kontak'; // Kontak pengguna
  String _address = 'Alamat'; // Alamat pengguna

  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi data yang ada ke dalam field
    _ownerNameController.text = _ownerName;
    _contactController.text = _contact;
    _addressController.text = _address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Akun'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Informasi Akun Penjual', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Username: $_username'),
            TextFormField(
              controller: _ownerNameController,
              decoration: const InputDecoration(labelText: 'Nama Pemilik Toko'),
              onChanged: (value) {
                _ownerName = value;
              },
            ),
            TextFormField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Kontak'),
              onChanged: (value) {
                _contact = value;
              },
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Alamat'),
              onChanged: (value) {
                _address = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveAccountInfo();
              },
              child: const Text('Simpan Perubahan'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                );
              },
              child: const Text('Ubah Kata Sandi', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  void _saveAccountInfo() {
    // Logika untuk menyimpan perubahan pada informasi akun
    // Simpan _ownerName, _contact, _address ke penyimpanan

    // Simpan data yang diubah ke variabel state agar terupdate di layar
    setState(() {
      _ownerName = _ownerNameController.text;
      _contact = _contactController.text;
      _address = _addressController.text;
    });

    // Tampilkan pesan notifikasi atau perubahan berhasil disimpan
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Perubahan berhasil disimpan')));
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Kata Sandi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Kata Sandi Saat Ini'),
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Kata Sandi Baru'),
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Konfirmasi Kata Sandi Baru'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan kata sandi baru
                // Validasi kata sandi dan simpan ke penyimpanan
                // Tampilkan pesan notifikasi perubahan berhasil
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kata sandi berhasil diubah')));
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
