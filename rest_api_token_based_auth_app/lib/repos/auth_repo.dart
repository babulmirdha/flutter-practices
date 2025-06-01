import 'dart:convert';

import '../models/user.dart';
import '../providers/auth_provider.dart';


class AuthRepo {
  final AuthProvider _provider = AuthProvider();

  Future<String> signup(Map<String, dynamic> body) async {
    final response = await _provider.signup(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Signup successful";
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? "Signup failed");
    }
  }

  Future<String> login(Map<String, dynamic> body) async {
    final response = await _provider.login(body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception("Login failed");
    }
  }

  Future<User> getMe(String token) async {
    final response = await _provider.getMe(token);
    if (response.statusCode == 200) {
      try{
        return User.fromJson(jsonDecode(response.body));
      }catch(e,s){
        print("$e, $s");
        throw Exception("Unable to fetch user");
      }

    } else {
      throw Exception("Unable to fetch user");
    }
  }
}
