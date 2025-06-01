
import 'package:api/modal/user.dart';
import 'package:api/services/user_api.dart';
import "package:flutter/material.dart";

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState(){
    super.initState();
    fetchUsers();
  }
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

          return ListTile(

            title: Text(user.name.first),
            subtitle: Text(user.location.postcode),
            tileColor:color,
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      // ),
    );
  }
  Future<void> fetchUsers() async {
    final response= await UserApi.fetchUsers();
setState(() {
  users=response;
});
  }
}
