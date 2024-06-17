import 'dart:convert';

import 'package:hepsi_burada/model/comment.dart';
import 'package:hepsi_burada/model/commerse_user.dart';
import 'package:hepsi_burada/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../constant/commerse_url.dart';

class CommerseUserService {
  final String getCommerseUrl = "$commerseUrl/users";
  Future<CommentUserModel?> getCommerseUserMethod() async {
    var response = await http.get(Uri.parse(getCommerseUrl));
    try {
      if (response.statusCode == 200) {
        var result = CommentUserModel.fromJson(jsonDecode(response.body));
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class ProductService {
  final String productUrl = "$commerseUrl/products";
  Future<ProductModel?> getProductService() async {
    var response = await http.get(Uri.parse(productUrl));
    try {
      var result = ProductModel.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}

class CommentSevice {
  final String commentUrl = "$commerseUrl/comments";
  Future<CommentModel?> getCommentMethod() async {
    var response = await http.get(Uri.parse(commentUrl));
    try {
      var result = CommentModel.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
