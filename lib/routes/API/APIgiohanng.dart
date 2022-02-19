import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:giaodien/routes/models/giohang.dart';
import 'package:http/http.dart' as http;

const String _url = 'http://10.0.2.2:8000/api/';
Future themgiohang(Map<String, String> data) async {
  var url = _url + 'gioHang';
  var request = await http.post(Uri.parse(url),
      body: jsonEncode(data), headers: _setHeader());
  if (request.statusCode == 200) {
    if (request.body == 'Success') {
      return 'Success';
    } else {
      return 'TooMuch';
    }
  } else {
    return "Fail";
  }
}

Future xoagiohang(id) async {
  var url = _url + 'gioHang/' + id.toString();
  var request = await http.delete(Uri.parse(url));
  if (request.statusCode == 200) {
    return 'Success';
  } else {
    return "Fail";
  }
}

Future doneXoa(Map<String, int> data) async {
  var url = _url + 'giohang/doneInvoice';
  var request = await http.post(Uri.parse(url),
      body: jsonEncode(data), headers: _setHeader());
  print(data);
  print(request.body);
  if (request.statusCode == 200) {
    return 'Success';
  } else {
    return "Fail";
  }
}

Future chinhsoluong(Map<String, int> data) async {
  var url = _url + 'giohang';
  var request = await http.post(Uri.parse(url),
      body: jsonEncode(data), headers: _setHeader());
  print(data);
  print(request.body);
  if (request.statusCode == 200) {
    return 'Success';
  } else {
    return "Fail";
  }
}

class LayGioHangProvider extends ChangeNotifier {
  List<GioHang> giohang = [];
  Future<void> laygiohang(acc) async {
    List<GioHang> giohang2 = [];
    var url = _url + 'gioHang/' + acc.toString();
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      data.forEach((i) {
        giohang2.add(GioHang.fromJson(i));
      });
    } else {
      throw Exception('No find data');
    }
    giohang = giohang2;
    notifyListeners();
  }
}



_setHeader() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
