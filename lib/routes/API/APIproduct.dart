import 'dart:convert';
import 'package:giaodien/routes/models/account.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

List<Product> sanphams(String response) {
  var list = jsonDecode(response);

  return list.map<Product>((model) => Product.fromJson(model)).toList();
}

Future<List<Product>> fetchPostSanPham() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/sanPham'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

Future<List<Product>> fetchSanPhamtheoLoai(int idLoaisp) async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/sanPham/$idLoaisp'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}
