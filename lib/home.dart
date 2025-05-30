import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <dynamic> users=[];
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
          final email = user['email'];
          final name = user['name']['first'];
          final imageUrl = user['picture']['thumbnail'];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageUrl),
            ),
            title: Text(name),
            subtitle: Text(email),
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
      final json = jsonDecode(response.body);
      setState(() {
        users = json['results'];
      });
      print('Users: $users');
      print('fetchUsers completed');
    } else {
      print('Failed to fetch users');
    }
  }
}