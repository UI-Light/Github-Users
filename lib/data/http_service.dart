import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String _baseUrl = "https://api.github.com/";

  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(_baseUrl + url));

    final result = jsonDecode(response.body);
    if (result is List) return {"data": result};
    return result;
  }
}
