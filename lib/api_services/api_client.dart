import 'package:covid_19_app/model/worldwild_model.dart';
import 'package:covid_19_app/utils/app_url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<WorldWildModel> worldWildData() async {
    final response = await http.get(Uri.parse(Appurl.worldwild));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response);
      print(response.statusCode.toString());
      print(data);
      return WorldWildModel.fromJson(data);
    } else {
      throw Exception("Eror");
    }
  }

  Future<List<dynamic>> countriesData() async {
    final response = await http.get(Uri.parse(Appurl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response);
      print(data);
      return data;
    } else {
      throw Exception("Eror");
    }
  }
}
