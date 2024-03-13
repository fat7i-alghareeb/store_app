import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsServices {
  Future<List<dynamic>> getMethod(String uriString) async {
    final uri = Uri.parse(uriString);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      final x = json.decode(response.body);
      return x["products"];
    } else {
      throw Exception("error in api");
    }
  }
}
