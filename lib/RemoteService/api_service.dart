import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> fetchData(String path) async {
    final response = await http.get(Uri.parse(path));
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
