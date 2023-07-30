// ignore_for_file: camel_case_types, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:ecommarce_app/models/details_model.dart';
import 'package:ecommarce_app/utils/appconst.dart';
import 'package:ecommarce_app/utils/datalists.dart';
import 'package:http/http.dart' as http;

class HomePage_Repo {
  Future<List<Emp>?> getAPIList() async {
    String url = "${Appconst.baseurl}products";
    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    print(response.body);

    var items = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> element in items) {
        EmpList.add(Emp.fromJson(element));
      }
      return EmpList;
    } else {
      return EmpList;
    }
    //var ans = jsonDecode(response.body);
    //   if (response.statusCode != 200) {
    //     print("Server Erroe : ${response.statusCode}");
    //     return null;
    //   }

    //   try {
    //     print(response.body);
    //     return empFromJson(response.body);
    //   } catch (e) {
    //     print("Error Catch $e");
    //     return null;
    //   }
    // }
  }
}
