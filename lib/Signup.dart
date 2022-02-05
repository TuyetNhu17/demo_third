import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giaodien/Element/colorbutton.dart';
import 'Element/textfield.dart';
import 'Element/General.dart';
import 'Element/Titile.dart';
import 'package:image_picker/image_picker.dart';

import 'routes/API/APIaccount.dart';

// enum sex { nam, nu }
// sex _sex = sex.nam;

class SignupSreen extends StatefulWidget {
  const SignupSreen({Key? key}) : super(key: key);

  @override
  Signup createState() => Signup();
}

class Signup extends State<SignupSreen> {
  // Column radio(String a, sex gioitinh) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       RadioListTile<sex>(
  //         contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
  //         title: Text(a),
  //         value: gioitinh,
  //         groupValue: _sex,
  //         onChanged: (sex? value) {
  //           setState(() {
  //             _sex = value!;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _tendangnhap = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _matkhau = TextEditingController();
  final TextEditingController _xacnhanmatkhau = TextEditingController();
  TextEditingController _sdt = TextEditingController();
  TextEditingController _diachi = TextEditingController();
  TextEditingController _ngaysinh = TextEditingController();
  TextEditingController _gioitinh = TextEditingController();
  TextEditingController _hoten = TextEditingController();
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar('Đăng kí'),
          backgroundColor: Color(0xffe59191),
        ),
        body: background(
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AvatarProfile(),
                      form("Tên đăng nhập", Icons.account_circle,
                          TextInputType.text, false, _tendangnhap),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Email", Icons.email, TextInputType.text, false,
                          _email),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Họ tên", Icons.email, TextInputType.text, false,
                          _hoten),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Mật khẩu", Icons.password, TextInputType.text, true,
                          _matkhau),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Nhập lại mật khẩu", Icons.password,
                          TextInputType.text, true, _xacnhanmatkhau),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Số điện thoại", Icons.phone, TextInputType.number,
                          false, _sdt),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Địa chỉ", Icons.home, TextInputType.text, false,
                          _diachi),
                      const SizedBox(
                        height: 10,
                      ),
                      form("Ngày sinh", Icons.cake, TextInputType.datetime,
                          false, _ngaysinh),
                      const SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: radio("Nam", sex.nam),
                      //     ),
                      //     Expanded(
                      //       child: radio("Nữ", sex.nu),
                      //     ),
                      //   ],
                      // ),
                      colorbutton(FlatButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DangKiTaiKhoan();
                            print('Sucess');
                          } else {
                            print('Unsuccess');
                          }
                        },
                        child: const Text(
                          "Tạo tài khoản",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            context));
  }

  // ignore: non_constant_identifier_names
  Future DangKiTaiKhoan() async {
    Map<String, String> data = {
      '_tendangnhap': _tendangnhap.text,
      '_email': _email.text,
      '_matkhau': _matkhau.text,
      '_hoten': _hoten.text,
      '_sodienthoai': _sdt.text,
      '_diachi': _diachi.text,
      
    };
    var res = await postData(data, 'khachHang/');
    if (res == 'Success') {
      Navigator.pushNamed(context, '/second');
    } else {
      print('Fail');
    }
  }

  Future Avatar() async {}

  void takePhoto() async {
    final _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = _pickedFile!;
    });
    print(_imageFile!.path);
  }

  Widget AvatarProfile() {
    return Center(
      child: Stack(
        children: [
          _imageFile == null
              ? CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/avatar.png'),
                )
              : CircleAvatar(
                  radius: 80.0,
                  backgroundImage: FileImage(File(_imageFile!.path)),
                ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                  onTap: () {
                    takePhoto(); 
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black87,
                    size: 28.0,
                  )))
        ],
      ),
    );
  }
}
