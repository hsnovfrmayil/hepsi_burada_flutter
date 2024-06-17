import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/placeholder_model.dart';

class PlaceholderService {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  Future<PlaceholderModel> getJson() async {
    var response = await http.get(Uri.parse(url));
    try {
      var result = PlaceholderModel.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
