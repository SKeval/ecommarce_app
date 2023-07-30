// ignore_for_file: camel_case_types, library_prefixes, prefer_interpolation_to_compose_strings, avoid_print

import 'package:ecommarce_app/models/add_user_model.dart' as addUser;
import 'package:ecommarce_app/models/user_model.dart';
import 'package:ecommarce_app/utils/appconst.dart';
import 'package:http/http.dart' as http;

class Registration_Repo {
  Future<AddUserResponse?> getdDetails(
      String fname,
      String lname,
      String email,
      String username,
      String street,
      String city,
      String password,
      String number,
      String zipcode,
      String phone) async {
    String url = "${Appconst.baseurl}users";

    try {
      var nameModel = addUser.Name(firstname: fname, lastname: lname);
      var userData = addUser.AddUserModel(
          email: email,
          username: username,
          password: password,
          name: nameModel,
          address: addUser.Address(
              city: city,
              street: street,
              number: int.parse(number),
              zipcode: zipcode),
          phone: phone);

      var body = addUser.addUserModelToJson(userData);
      // Map<String, dynamic> body = {
      //   'email': email,
      //   'username': username,
      //   'password': password,
      //   'name': name,
      //   // 'address': {
      //   'city': city,
      //   'street': street,
      //   'number': number,
      //   'zipcode': zipcode,
      // },
      // 'phone': phone
      //};
      var response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode != 200) {
        return null;
      }
      print("Body : " + response.body);
      print(response.statusCode);

      return addUserResponseFromJson(response.body);
    } catch (e) {
      print("error : $e");
      return null;
    }
  }
}
