import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/catagory.dart';

List<LoaiSanPham> LoaiSanPhams(String response) {
  var list = jsonDecode(response).cast<Map<String, dynamic>>();

  return list.map<LoaiSanPham>((json) => LoaiSanPham.fromJson(json)).toList();
}

Future<List<LoaiSanPham>> fetchLoaiSanPham() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/loaiSanPham'));
  if (response.statusCode == 200) {
    return LoaiSanPhams(response.body);
  } else {
    throw Exception('No find data');
  }
}
