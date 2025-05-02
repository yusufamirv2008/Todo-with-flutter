import 'dart:convert';
import 'package:alif_academy/src/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRemoteDataSourceImpl  {


  PostRemoteDataSourceImpl();

   Future<List<PostModel>> getPostsByUser(int userId) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$userId'),
    //  headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
