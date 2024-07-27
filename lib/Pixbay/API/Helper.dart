// https://pixabay.com/api/?key=45125788-56291d9cb2536e44481edb96f&q=

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apihelper=ApiHelper._();
  ApiHelper._();
  Future<dynamic> fetchApiData(String search)
  async {
    String api = "https://pixabay.com/api/?key=45125788-56291d9cb2536e44481edb96f&q=$search&image_type=photo";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    }
    else {}
  }
  }