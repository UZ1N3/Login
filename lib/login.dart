import 'package:http/http.dart' as http;
import 'dart:convert';

Future login(String email, String password) async {
  const String url = "https://reqres.in/api/login";
  final response = await http
      .post(Uri.parse(url), body: {'email': email, 'password': password});
  var convertedData = jsonDecode(response.body);
  return convertedData;
}
