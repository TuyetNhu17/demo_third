import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/catagory.dart';

List<Categori> loaisanpham(String response) {
  var parsed = json.decode(response) as List<dynamic>;
  return parsed.map<Categori>((json) => Categori.fromJson(json)).toList();
}

Future<List<Categori>> LayLoaiSanPham() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/loaiSanPham'));
  if (response.statusCode == 200) {
    return loaisanpham(response.body);
  } else {
    throw Exception('No find data');
  }
}
