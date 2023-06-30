import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_parser_factory.dart';

class ApiClient {
  final String baseUrl;

  const ApiClient({required this.baseUrl});

  Future<List<T>> fetchData<T>(String endpoint) async {
    final dataParser = DataParserFactory.getParser<T>();
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => dataParser.fromJson(json)).toList();
    } else {
      throw ("${response.statusCode} ${response.reasonPhrase}.\nFailed to load data");
    }
  }
}
