import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:giaodien/routes/models/invoice.dart';
import 'package:giaodien/routes/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:giaodien/routes/models/giohang.dart';
import 'package:giaodien/routes/models/invoice_detail.dart';

class HoaDonGet extends ChangeNotifier{

static List<HoaDon> parseInvoice(String response) { 
   var  parsed = json.decode(response) as List<dynamic>;
   return parsed.map<HoaDon>((json) => HoaDon.fromJson(json)).toList(); 
}
static String host = "http://10.0.2.2:8000/api/";
  List<HoaDon> invoices = [];
  List <CTHoaDon> invoice_detail = [];

static _setHeader() => {
  'Content-type' : 'application/json; charset=utf-8',
  'Accept' : 'application/json'
};
static Future<bool> createInvoice (Map<String, String> data) async {
  
  var url = host + "invoice/newInvoice";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     print(response.statusCode);
     return true;
   } else {
     print(response.statusCode);
     return false;
   } 
}

static Future<String> getInvoiceId (var data)async{
  String invoiceId;
  var url = host + "invoice/getInvoiceId";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic id = jsondata["id"];
     invoiceId = id.toString();
     return invoiceId;
   } else {
     throw Exception('khong thanh cong');
    
   } 
}
static Future<void> addInvoiceDetail (var data) async {
  print(data);
  var url = host + "invoiceDetail/newInvoiceDetail";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   print(response.statusCode);
   if (response.statusCode == 200) { 
     print("Them thanh cong");
   } else {
     throw Exception('Khong thanh cong');
    
   } 
}

 Future<void> getInvoiceListByAccountId (var data) async {
  List<HoaDon> invoices1 = [];
  var url = host + "invoice/getInvoiceId";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     data.forEach((i){
        invoices1.add(HoaDon.fromJson(i));
     });
   
   } else {
     throw Exception('Khong thanh cong');
    
   } 
    invoices = invoices1;
    print(invoices.length);
      notifyListeners();
}
}