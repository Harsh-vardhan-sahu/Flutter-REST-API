import 'package:api/api_services.dart';
import 'package:api/listmodel.dart'; // Make sure PostModel is defined here
import 'package:flutter/material.dart';

// Rename widget class to avoid name clash with data model
class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  bool isLoading = false;
  List<Listmodel> postList = [];

  void _getPosts() {
    setState(() {
      isLoading = true;
    });

    apiservice().getPostWithmodel().then((value) {
      setState(() {
        postList = value!.cast<Listmodel>();
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post with Model"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(postList[index].id.toString()),
              title: Text(postList[index].title ?? ""),
              subtitle: Text(postList[index].body ?? ""),
            ),
          );
        },
      ),
    );
  }
}
