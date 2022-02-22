import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

List<Product> sanphams(String response) {
  var list = jsonDecode(response);
  return list.map<Product>((model) => Product.fromJson(model)).toList();
}

String _url = 'http://10.0.2.2:8000/api/';
Future<List<Product>> laySanPhamall() async {
  final response =
      await http.get(Uri.parse(_url+'sanPham'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

class LaySanPhamProvider extends ChangeNotifier {
  List<Product> sanphams = [];
  Future<void> LaySanPham() async {
    List<Product> sanpham2 = [];
    var url =_url+'sanPham';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      data.forEach((i) {
        sanpham2.add(Product.fromJson(i));
      });
    } else {
      throw Exception('No find data');
    }
    sanphams = sanpham2;

    notifyListeners();
  }
}

Future<List<Product>> SanPhamTrangChu() async {
  final response =
      await http.get(Uri.parse(_url+'sanpham/trangchu'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

Future<List<Product>> SanPhamMoi() async {
  final response =
      await http.get(Uri.parse(_url+'sanpham/sanphammoi'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

Future<List<Product>> SanPhamBanChay() async {
  final response = await http
      .get(Uri.parse(_url+'sanpham/sanphambanchay'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

Future<List<Product>> SanPhamNoiBat() async {
  final response = await http
      .get(Uri.parse(_url+'sanpham/sanphamnoibat'));
  if (response.statusCode == 200) {
    return sanphams(response.body);
  } else {
    throw Exception('No find data');
  }
}

Future<List<Product>> fetchSearch(String query) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/sp/ds'));
  if (response.statusCode == 200) {
    List products = jsonDecode(response.body);
    return products
        .map<Product>((json) => Product.fromJson(json))
        .where((products) {
      final titleLower = products.ten_san_pham.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
  } else {
    throw Exception('No find data');
  }
}
