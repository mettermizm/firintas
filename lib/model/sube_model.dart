class SubeModel {
  final String isim;
  final String adres;
  final String gorsel;
  final String puan;

  SubeModel({
    required this.isim,
    required this.adres,
    required this.gorsel,
    required this.puan,
  });

  // Verileri haritadan alarak bir SubeModel nesnesi oluşturan factory constructor
  factory SubeModel.fromMap(Map<String, String> map) {
    return SubeModel(
      isim: map['isim'] ?? '',
      adres: map['adres'] ?? '',
      gorsel: map['gorsel'] ?? '',
      puan: map['puan'] ?? '',
    );
  }

  // Nesneyi haritaya dönüştürmek için bir fonksiyon (gerekirse kullanılabilir)
  Map<String, String> toMap() {
    return {
      'isim': isim,
      'adres': adres,
      'gorsel': gorsel,
      'puan': puan,
    };
  }
}
