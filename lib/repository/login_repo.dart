// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecommarce_app/utils/appconst.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<String> checkAuth(String email, String password) async {
    Map<String, String> body = {'username': email, 'password': password};

    String url = "${Appconst.baseurl}auth/login";
    var response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode != 200) {
      print("Not log in");
      return "Not Log in";
    }
    try {
      print('Token ${response.body}');
      return jsonDecode(response.body)['token'];
    } catch (e) {
      print("Error $e");
      return 'Error $e';
    }
  }
}
