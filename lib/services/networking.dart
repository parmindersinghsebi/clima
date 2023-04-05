import 'package:http/http.dart';
import 'dart:convert';

class networking {
  networking(this.url);

  final url;

  Future getdata() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
