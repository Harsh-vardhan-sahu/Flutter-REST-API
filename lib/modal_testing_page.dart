import 'dart:convert';

import 'package:api/modal/user.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List <User> users=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API") ,
      ) ,
      body: users.isEmpty
          ? Center(child: Text('No users loaded.'))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email=user.email;
          final phone=user.phone;
          final color=user.gender=='male'? Colors.blue:Colors.yellow;
          // final email = user['email'];
          //final name = user['name']['first'];
          //final imageUrl = user['picture']['thumbnail'];

          return ListTile(

            title: Text(user.name.first),
            subtitle: Text(phone),
            tileColor:color,
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }Future<void> fetchUsers() async {
    print('fetchUsers called');
    final url = 'https://randomuser.me/api/?results=30'; // Make sure to use HTTPS!
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final decodedJson=jsonDecode(response.body);
      final results=decodedJson['results'] as List<dynamic>;
      final transformed= results.map((e){
        final name=UserName(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last'],
        );
        return User(
          cell: e['cell'],
          email: e['email'],
          nat:e['nat'],
          phone:e['phone'],
          gender: e['gender'],
          name: name,
        );
      }).toList();

      setState(() {
        users = transformed;
      });
      print('Users: $users');
      print('fetchUsers completed');
    } else {
      print('Failed to fetch users');
    }
  }
}
