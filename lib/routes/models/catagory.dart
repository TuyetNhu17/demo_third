class LoaiSanPham {
  final int id;
  final String ten_loai;
  final String hinh_anh;
  LoaiSanPham({
    required this.id,
    required this.ten_loai,
    required this.hinh_anh,
   
  });
  LoaiSanPham.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten_loai = json['ten_loai'],
        hinh_anh = json['hinh_anh'];
        
  Map<String, dynamic> toJson() => {
        'id': id,
        'ten_loai': ten_loai,
        'hinh_anh': hinh_anh,
      };
}