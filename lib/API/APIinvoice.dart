import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:giaodien/models/ct_donhang.dart';
import 'package:giaodien/models/invoice.dart';
import 'package:giaodien/models/donhang.dart';
import 'package:giaodien/models/invoice_detail.dart';
import 'package:http/http.dart' as http;

class HoaDonGet extends ChangeNotifier {
  static List<HoaDon> parseInvoice(String response) {
    var parsed = json.decode(response) as List<dynamic>;
    return parsed.map<HoaDon>((json) => HoaDon.fromJson(json)).toList();
  }

  static String host = "http://10.0.2.2:8000/api/";
  List<HoaDon> invoices = [];
  List<CTHoaDon> invoice_detail = [];

  static _setHeader() => {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      };
  static Future<bool> createInvoice(Map<String, String> data) async {
    var url = host + "invoice/newInvoice";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  static Future<String> getInvoiceId(var data) async {
    String invoiceId;
    var url = host + "invoice/getInvoiceId";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic id = jsondata["id"];
      invoiceId = id.toString();
      return invoiceId;
    } else {
      throw Exception('khong thanh cong');
    }
  }

  static Future<void> addInvoiceDetail(var data) async {
    print(data);
    var url = host + "invoiceDetail/newInvoiceDetail";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Them thanh cong");
    } else {
      throw Exception('Khong thanh cong');
    }
  }

  Future<void> getInvoiceListByAccountId(var data) async {
    List<HoaDon> invoices1 = [];
    var url = host + "invoice/getInvoiceId";
    http.Response response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      data.forEach((i) {
        invoices1.add(HoaDon.fromJson(i));
      });
    } else {
      throw Exception('Khong thanh cong');
    }
    invoices = invoices1;
    notifyListeners();
  }
}

class LayDonHangProvider extends ChangeNotifier {
  List<DonHang> donhang = [];

  List<CT_DonHang> ctdonhang = [];

  String _url = "http://10.0.2.2:8000/api/";

  _setHeader() => {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      };

  Future<void> laydonhang(email) async {
    List<DonHang> donhang2 = [];
    var url = _url + 'invoice/show/' + email;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["data"];
      data.forEach((i) {
        donhang2.add(DonHang.fromJson(i));
      });
    } else {
      throw Exception('No find data');
    }
    donhang = donhang2;
    notifyListeners();
  }

  List<CT_DonHang> ctdh(String response) {
    var list = jsonDecode(response);
    return list.map<CT_DonHang>((model) => CT_DonHang.fromJson(model)).toList();
  }

  Future<List<CT_DonHang>> laychitiet(data) async {
    var url = _url + 'invoiceDetail/show';
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return ctdh(response.body);
    } else {
      throw Exception('No find data');
    }
  }

  Future<String> huydonhang(mahd) async {
    var url = _url + 'invoice/huy/' + mahd;
    EasyLoading.show();
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return "Success";
    } else {
      return "Fail";
    }
  }
}
