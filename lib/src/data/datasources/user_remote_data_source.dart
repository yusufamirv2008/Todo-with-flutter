import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

// abstract class UserRemoteDataSource {
//   Future<List<UserModel>> getUsers();
// }

class UserRemoteDataSourceImpl  {


  UserRemoteDataSourceImpl();

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    //  headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
