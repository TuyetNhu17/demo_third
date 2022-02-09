class Product {
  final int id;
  final String ten_san_pham;
  final String mo_ta;
  final int so_luong;
  final int don_gia;
  final String hinh_anh;
  final int loai_san_pham_id;

  Product({
    required this.id,
    required this.ten_san_pham,
    required this.mo_ta,
    required this.so_luong,
    required this.don_gia,
    required this.hinh_anh,
    required this.loai_san_pham_id,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten_san_pham = json['ten_san_pham'],
        mo_ta = json['mo_ta'],
        so_luong = json['so_luong'],
        don_gia = json['don_gia'],
        hinh_anh = json['hinh_anh'],
        loai_san_pham_id = json['loai_san_pham_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'ten_san_pham': ten_san_pham,
        'mo_ta': mo_ta,
        'don_gia': don_gia,
        'so_luong': so_luong,
        'hinh_anh': hinh_anh,
        'loai_san_pham_id': loai_san_pham_id,
      };
      int? compareTo(other) {
    if (this.don_gia < other.don_gia) {
      return -1;
    }

    if (this.don_gia > other.don_gia) {
      return 1;
    }

    if (this.don_gia == other.don_gia) {
      return 0;
    }
    return null;
  }
}
