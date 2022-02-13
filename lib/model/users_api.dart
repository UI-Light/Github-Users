import 'package:http/http.dart' as http;

Future<http.Response> getUsers() {
  return http.get(Uri.parse('https://api.github.com/users?language=flutter'));
}
