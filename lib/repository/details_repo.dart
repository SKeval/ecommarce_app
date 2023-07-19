// ignore_for_file: avoid_print

import 'package:ecommarce_app/models/details_model.dart';
import 'package:ecommarce_app/utils/appconst.dart';
import 'package:http/http.dart' as http;

class DetailsRepo {
  Future<List<Emp>?> getdata() async {
    String url = "${Appconst.baseurl}products";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);

    //var ans = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print("Server Erroe : ${response.statusCode}");
      return null;
    }

    try {
      print(response.body);
      return empFromJson(response.body);
    } catch (e) {
      print("Error Catch $e");
      return null;
    }
  }
}
