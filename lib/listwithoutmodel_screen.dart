import 'package:api/api_services.dart';
import 'package:flutter/material.dart';

class PostListWithoutModel extends StatefulWidget {
  const PostListWithoutModel({super.key});

  @override
  State<PostListWithoutModel> createState() => _PostListWithoutModelState();
}

class _PostListWithoutModelState extends State<PostListWithoutModel> {
  List<dynamic> postList = [];
  bool isReady = false;

  _getPost() {
    apiservice().getPostWithoutmodel().then((value) {
      setState(() {
        postList = value;
        isReady = true;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    _getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts without model"),
      ),
      body: !isReady
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(postList[index]["id"].toString()),
              title: Text(postList[index]["title"].toString()),
              subtitle: Text(postList[index]["body"].toString()),
            ),
          );
        },
      ),
    );
  }
}
