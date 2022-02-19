class Account {
  final int id;
  final String mat_khau;
  final String ho_ten;
  final String so_dien_thoai;
  final String email;
  final String dia_chi;
  final String hinh_anh;

  Account.fromJson(Map<String, dynamic> json) 
    :id = json['id'],
    mat_khau = json['mat_khau'],
    ho_ten = json['ho_ten'],
    so_dien_thoai = json['so_dien_thoai'],
    email = json['email'],
    dia_chi = json['dia_chi'],
    hinh_anh = json['hinh_anh'];
  

  Map<String, dynamic> toJson()=> {
    'id' : id,
    'mat_khau' : mat_khau,
    'ho_ten' : ho_ten,
    'so_dien_thoai' : so_dien_thoai,
    'email' : email,
    'dia_chi' : dia_chi,
    'hinh_anh' : hinh_anh,
  };
}