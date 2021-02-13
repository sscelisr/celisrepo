import 'dart:convert';
import 'dart:io';

import 'package:ejemplo/models/employees.dart';
import 'package:http/http.dart' as http;

class EmployeesProvider {
  final URL_BASE =
      "https://raw.githubusercontent.com/sapardo10/content/master/RH.json";

  Future<List<Employess>> obtenerEmployesss() async {
    var url = '$URL_BASE';
    var response = await http.get(url);

     Map<String, dynamic> responseData = json.decode(response.body);
     List gruposJson = responseData["data"];
    print(gruposJson);

    return gruposJson;
  }
}
