class HoaDon {
  final int id;
  final String email;
  final String dia_chi;
  final String so_dien_thoai;
  final int tong_tien;
  final String loai_hd;

  HoaDon(
      {
     required this.id,
     required this.email,
     required this.dia_chi,
     required  this.so_dien_thoai,
     required this.tong_tien,
     required this.loai_hd,
     });

  HoaDon.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    email = json['email'],
    dia_chi = json['dia_chi'],
    so_dien_thoai = json['so_dien_thoai'],
    tong_tien = json['tong_tien'],
    loai_hd = json['loai_hd'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['dia_chi'] = this.dia_chi;
    data['so_dien_thoai'] = this.so_dien_thoai;
    data['tong_tien'] = this.tong_tien;
    data['loai_hd'] = this.loai_hd;
    return data;
  }
}