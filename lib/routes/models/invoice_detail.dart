class CTHoaDon {
  final int id;
  final int id_san_pham;
  final int so_luong;
  final int don_gia;

  CTHoaDon(
      {
     required this.id,
     required this.id_san_pham,
     required this.so_luong,
     required  this.don_gia,
     });

  CTHoaDon.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    id_san_pham = json['id_san_pham'],
    so_luong = json['so_luong'],
    don_gia = json['don_gia'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_san_pham'] = this.id_san_pham;
    data['so_luong'] = this.so_luong;
    data['don_gia'] = this.don_gia;
    return data;
  }
}