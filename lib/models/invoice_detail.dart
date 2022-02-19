class CTHoaDon {
  final int id;
  final id_hoa_don;
  final int id_san_pham;
  final int so_luong;
  final int don_gia;
  final int tong;

  CTHoaDon(
      {
     required this.id,
    required this.id_hoa_don,
     required this.id_san_pham,
     required this.so_luong,
     required  this.don_gia,
     required  this.tong,
     });

  CTHoaDon.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    id_san_pham = json['id_san_pham'],
    id_hoa_don = json['id_hoa_don'],
    so_luong = json['so_luong'],
    don_gia = json['don_gia'],
    tong = json['tong'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_san_pham'] = this.id_san_pham;
    data['id_hoa_don'] = this.id_hoa_don;
    data['so_luong'] = this.so_luong;
    data['don_gia'] = this.don_gia;
    data['tong'] = this.tong;
    return data;
  }
}