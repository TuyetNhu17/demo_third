class GioHang {
  final int id;
  final int id_san_pham;
  final int so_luong_mua;
  final int don_gia;
  final String hinh_anh;
  final String ten_san_pham;
  GioHang({
    required this.id,
    required this.id_san_pham,
    required this.so_luong_mua,
    required this.don_gia,
    required this.hinh_anh,
    required this.ten_san_pham,
  });
  GioHang.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        id_san_pham = json['id_san_pham'],
        so_luong_mua = json['so_luong_mua'],
        don_gia = json['don_gia'],
        hinh_anh = json['hinh_anh'],
        ten_san_pham = json['ten_san_pham'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_san_pham': id_san_pham,
        'so_luong_mua': so_luong_mua,
        'don_gia': don_gia,
        'hinh_anh': hinh_anh,
        'ten_san_pham': ten_san_pham,
      };
}
