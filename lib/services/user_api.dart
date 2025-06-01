import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/user.dart';
import '../modal/user_name.dart';
// 'modal/user_name.dart';
class UserApi {
  static Future<List<User>> fetchUsers() async {
    final url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final results = decodedJson['results'] as List<dynamic>;
      final users = results.map((e) {
        final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        );
        return User(
          cell: e['cell'],
          email: e['email'],
          nat: e['nat'],
          phone: e['phone'],
          gender: e['gender'],
          name: name,
        );
      }).toList();
      return users;
    } else {
      print('Failed to fetch users');
      return []; // Or: throw Exception('Failed to fetch users');
    }
  }
}
