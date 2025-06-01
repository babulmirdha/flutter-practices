import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider {
  final String baseUrl = "http://192.168.10.249:3000/api";

  Future<http.Response> signup(Map<String, dynamic> body) async {
    return await http.post(
      Uri.parse("$baseUrl/auth/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }

  Future<http.Response> login(Map<String, dynamic> body) async {
    return await http.post(
      Uri.parse("$baseUrl/auth/signin"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getMe(String token) async {
    return await http.get(
      Uri.parse("$baseUrl/auth/me"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  }
}
