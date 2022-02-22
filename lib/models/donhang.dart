class DonHang {
  final int id;
  final String email;
  final String ngay_lap;
  final String dia_chi;
  final String so_dien_thoai;
  final int tong_tien;
  final int loai_hd;
  final String ten_san_pham;
  final String hinh_anh;
  final int so_luong_ct;
  final int don_gia_ct;

  DonHang({
    required this.id,
    required this.email,
    required this.ngay_lap,
    required this.dia_chi,
    required this.so_dien_thoai,
    required this.tong_tien,
    required this.loai_hd,
    required this.ten_san_pham,
    required this.hinh_anh,
    required this.so_luong_ct,
    required this.don_gia_ct,
  });

  DonHang.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        ngay_lap = json['ngay_lap'],
        dia_chi = json['dia_chi'],
        so_dien_thoai = json['so_dien_thoai'],
        tong_tien = json['tong_tien'],
        loai_hd = json['loai_hd'],
        ten_san_pham = json['ten_san_pham'],
        hinh_anh = json['hinh_anh'],
        so_luong_ct = json['so_luong_ct'],
        don_gia_ct = json['don_gia_ct'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'email': this.email,
        'ngay_lap': this.ngay_lap,
        'dia_chi': this.dia_chi,
        'so_dien_thoai': this.so_dien_thoai,
        'tong_tien': this.tong_tien,
        'loai_hd': this.loai_hd,
        'ten_san_pham': this.ten_san_pham,
        'hinh_anh': this.hinh_anh,
        'so_luong_ct': this.so_luong_ct,
        'don_gia_ct': this.don_gia_ct,
      };
}
