import 'dart:convert';
import 'package:http/http.dart' as http;

const String url = 'https://fakestoreapi.com/';

class Api {
  static Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.get(
      Uri.parse('$url$endPoint'),
      headers: headers,
    );
print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  static Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  static Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    print('url = $url body = $body token = $token ');
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
