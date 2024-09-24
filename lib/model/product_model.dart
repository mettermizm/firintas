class ProductModel {
  final String id;
  final String urunAdi;
  final String img1;
  final String fiyat;
  final String active;
  final String tarih;

  ProductModel({
    required this.id,
    required this.urunAdi,
    required this.img1,
    required this.fiyat,
    required this.active,
    required this.tarih,
  });

  // JSON'dan model sınıfına dönüştürmek için factory constructor
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      urunAdi: json['urun_adi'],
      img1: json['img1'],
      fiyat: json['fiyat'],
      active: json['active'],
      tarih: json['tarih'],
    );
  }
}
