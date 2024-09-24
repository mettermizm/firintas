class ProductModel {
  final String id;
  final String urunAdi;
  final String aciklama;
  final String img1;
  final String fiyat;
  final String rating;
  final String active;
  final String tarih;

  ProductModel({
    required this.id,
    required this.urunAdi,
    required this.aciklama,
    required this.img1,
    required this.fiyat,
    required this.rating,
    required this.active,
    required this.tarih,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      urunAdi: json['urun_adi'],
      aciklama: json['aciklama'],
      img1: json['img1'],
      fiyat: json['fiyat'],
      rating: json['rating'],
      active: json['active'],
      tarih: json['tarih'],
    );
  }
}
