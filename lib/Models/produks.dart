class Produk {
  String gambar;
  String nama;
  String jenis;
  int harga;
  String keterangan;

  Produk({
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.jenis,
    required this.keterangan
  });

  Produk.fromJson(Map<String, dynamic> json)
      : gambar = json['gambar'],
        nama = json['nama'],
        harga = json['harga'],
        jenis = json['jenis'],
        keterangan = json['keterangan'];

  Map<String, dynamic> toJson() {
    return {
      'gambar': gambar,
      'nama': nama,
      'harga': harga,
      'jenis': jenis,
      'keterangan': keterangan
    };
  }
}