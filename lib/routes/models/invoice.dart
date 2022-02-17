class HoaDon {
  final int id;
  final int id_tai_khoan;
  final String dia_chi;
  final String so_dien_thoai;
  final int tong_tien;

  HoaDon(
      {
     required this.id,
     required this.id_tai_khoan,
     required this.dia_chi,
     required  this.so_dien_thoai,
     required this.tong_tien,
     });

  HoaDon.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    id_tai_khoan = json['id_tai_khoan'],
    dia_chi = json['dia_chi'],
    so_dien_thoai = json['so_dien_thoai'],
    tong_tien = json['tong_tien'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_tai_khoan'] = this.id_tai_khoan;
    data['dia_chi'] = this.dia_chi;
    data['so_dien_thoai'] = this.so_dien_thoai;
    data['tong_tien'] = this.tong_tien;
    return data;
  }
}