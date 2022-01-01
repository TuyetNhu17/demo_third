class DanhMuc {
  final int id;
  final String imageUrl;
  final String category;
  DanhMuc({
    required this.id,
    required this.imageUrl,
    required this.category,
   
  });
  DanhMuc.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        category = json['tenloaisanpham'];
        
        

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'tenloaisanpham': category,
      };
}

/* final List<DanhMuc> danhmuc = [
  DanhMuc(
    id: 1,
    imageUrl: 'images/chia_buon/hoachiabuon1.jpg',
    category: 'Hoa Chia Buồn',
  ),
  DanhMuc(
    id: 2,
    imageUrl: 'images/chuc_mung/hoachucmung4.jpg',
    category: 'Hoa Chúc Mừng',
  ),
  DanhMuc(
    id: 3,
    imageUrl: 'images/hoa_cuoi/baby.jpg',
    category: 'Hoa Cưới',
  ),
  DanhMuc(
    id: 4,
    imageUrl: 'images/khai_truong/hoakhaitruong1.jpg',
    category: 'Hoa Khai Trương',
  ),
  DanhMuc(
    id: 5,
    imageUrl: 'images/lang_man/hoahong.jpg',
    category: 'Hoa Lang Mạng',
  ),
  DanhMuc(
    id: 6,
    imageUrl: 'images/sinh_nhat/babyHappy.jpg',
    category: 'Hoa Sinh Nhật',
  ),
];
 */