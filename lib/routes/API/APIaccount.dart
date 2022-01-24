import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/account.dart';

const String _url = 'http://10.0.2.2:8000/api/';
Future postData(data, url) async {
  var fullurl = _url + url;
  final res = await http.post(Uri.parse(fullurl),
      headers: _setHeader(), body: jsonEncode(data));
  if (res.statusCode == 200) {
    return 'Success';
  } else {
    print(res.body);
    throw Exception("Fail");
    
  }
}

Future <List<Account>> login (var data  ) async {
  List<Account> acc = [];
  String url = "http://10.0.2.2:8000/api/login";
   var response = await http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if(response.statusCode == 200)
   {
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     data.forEach((i){
       acc.add(Account.fromJson(i));
     });
    
     return acc;
   }
   else
   {
     print(response.body);
     throw Exception("Fail");
   }
  
}

_setHeader() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
