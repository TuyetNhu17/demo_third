import 'dart:convert';
import 'package:http/http.dart' as http;

const String _url = 'http://10.0.2.2:8000/api/';
Future postData(data, url) async {
  var fullurl = _url + url;
  final res = await http.post(Uri.parse(fullurl),
      headers: _setHeader(), body: jsonEncode(data));
  if (res.statusCode == 200) {
    return 'Success';
  } else {
    throw Exception("Fail");
  }
}

_setHeader() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
