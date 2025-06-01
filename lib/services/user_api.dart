import 'dart:convert';
import 'package:api/modal/user_location.dart';
import 'package:http/http.dart' as http;

import '../modal/user.dart';
import '../modal/user_dob.dart';
import '../modal/user_name.dart';
class UserApi {
  static Future<List<User>> fetchUsers() async {
    final url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    print('Status code: ${response.statusCode}' );
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
        final dob=Userdob(
          age:e['dob']['age'],
          date:e['dob']['date'],
          name:e['dob']['name']
        );
        final coordinate=LocationCoordinate(
            latitude: e['location']['coordinate']['latitude'],
            longitude: e['location']['coordinate']['longitude']);
        final street=LocationStreet(name: e['location']['street']['name'],
            number: e['location']['street']['number'],);
        final timezone=LocationTimezoneCoordinate(
            description: e['location']['timezone']['description'],
            offset: e['location']['timezone']['offset'],);
        final location=Userlocation(
            city: e['location']['city'],
            state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          coordinate: coordinate,
            street: street,
          timezone:timezone,);
        return User(
          cell: e['cell'],
          email: e['email'],
          nat: e['nat'],
          phone: e['phone'],
          gender: e['gender'],
          name: name,
          dob:dob,
          location: location,
        );
      }).toList();
      return users;
    } else {
      print('Failed to fetch users');
      return []; // Or: throw Exception('Failed to fetch users');
    }
  }
}
