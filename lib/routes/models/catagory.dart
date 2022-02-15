class Categori {
  final int id;
  final String ten_loai;
  Categori({
    required this.id,
    required this.ten_loai,
  });
  Categori.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten_loai = json['ten_loai'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'ten_loai': ten_loai,
      };
}
