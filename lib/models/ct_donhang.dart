class CT_DonHang {
  final String ten_san_pham;
  final String hinh_anh;
  final int so_luong_ct;
  final int don_gia_ct;

  CT_DonHang({
    required this.ten_san_pham,
    required this.hinh_anh,
    required this.so_luong_ct,
    required this.don_gia_ct,
  });

  CT_DonHang.fromJson(Map<String, dynamic> json)
      : 
        ten_san_pham = json['ten_san_pham'],
        hinh_anh = json['hinh_anh'],
        so_luong_ct = json['so_luong_ct'],
        don_gia_ct = json['don_gia_ct'];

  Map<String, dynamic> toJson() => {
        'ten_san_pham': this.ten_san_pham,
        'hinh_anh': this.hinh_anh,
        'so_luong_ct': this.so_luong_ct,
        'don_gia_ct': this.don_gia_ct,
      };
}
