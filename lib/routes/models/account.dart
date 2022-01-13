class Account {
  final int id;
  final String ten_dang_nhap;
  final String mat_khau;
  final String ho_ten;
  final String so_dien_thoai;
  final String email;
  final String dia_chi;
  final String hinh_anh;
  Account({
    required this.id,
    required this.ten_dang_nhap,
      required this.mat_khau,
     required this.ho_ten,
      required this.so_dien_thoai,
      required this.email,
      required this.dia_chi,
      required this.hinh_anh
  });

  Account.fromJson(Map<String, dynamic> json) 
    :id = json['id'],
    ten_dang_nhap = json['ten_dang_nhap'],
    mat_khau = json['mat_khau'],
    ho_ten = json['ho_ten'],
    so_dien_thoai = json['so_dien_thoai'],
    email = json['email'],
    dia_chi = json['dia_chi'],
    hinh_anh = json['hinh_anh'];
  

  Map<String, dynamic> toJson()=> {
    'id' : id,
    'ten_dang_nhap' : ten_dang_nhap,
    'mat_khau' : mat_khau,
    'ho_ten' : ho_ten,
    'so_dien_thoai' : so_dien_thoai,
    'email' : email,
    'dia_chi' : dia_chi,
    'hinh_anh' : hinh_anh,
  };
}