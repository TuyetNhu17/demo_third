import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/account.dart';

const String _url = 'http://10.0.2.2:8000/api/';
Future postData(Map<String, String> data, PickedFile? image) async {
  var url = 'http://10.0.2.2:8000/api/khachHang/';
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll(_setHeaderFIle());
  request.fields.addAll(data);
  if (image != null) {
    request.files.add(await http.MultipartFile.fromPath('_hinhanh', image.path,
        contentType: MediaType('image', 'jpg')));
  }

  var response = await request.send();
  if (response.statusCode == 200) {
    return "Success";
  } else {
    return "Fail";
  }
}

Future<String?> checkEmail(Map<String, String> dt) async {
  String? result;
  var url = 'http://10.0.2.2:8000/api/khachhang/checkEmail';
  var request =
      await http.post(Uri.parse(url), body: dt, headers: _setHeader());
  print(request.statusCode);
  if (request.statusCode == 200) {
    dynamic jsondata = json.decode(request.body);
    dynamic data = jsondata['data'];
    result = data;
    print(data);
    return result;
  } else {
    throw Exception('hcnb');
  }
}

_setHeaderFIle() =>
    {'Content-Type': 'application/json; charset=utf-8,image/jpg'};

Future<List<Account>> login(var data) async {
  List<Account> acc = [];
  String url = "http://10.0.2.2:8000/api/login";
  var response = await http.post(Uri.parse(url),
      headers: _setHeader(), body: jsonEncode(data));
  print(data);
  if (response.statusCode == 200) {
    dynamic jsondata = json.decode(response.body);
    dynamic data = jsondata["data"];
    data.forEach((i) {
      acc.add(Account.fromJson(i));
    });
    print(acc.length);
    return acc;
  } else {
    print(response.body);
    throw Exception("Fail");
  }
}

_setHeader() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
