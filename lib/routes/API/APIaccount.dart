import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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

_setHeader() => {'Accept': 'application/json'};

_setHeaderFIle() => {
      'Content-Type': 'application/json; charset=utf-8,image/jpg',
      'Accept': 'application/json'
    };
