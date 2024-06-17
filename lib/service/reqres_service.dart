import 'dart:convert';

import 'package:hepsi_burada/model/reqres_model.dart';
import 'package:http/http.dart' as http;
import '../constant/reqres_url.dart';

class ReqresUserService {
  final String getReqresUser = "$reqresUrl/users?page=2";

  Future<ReqresModel?> reqresUserMethod() async {
    var response = await http.get(Uri.parse(getReqresUser));
    try {
      if (response.statusCode == 200) {
        var result = ReqresModel.fromJson(jsonDecode(response.body));
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
