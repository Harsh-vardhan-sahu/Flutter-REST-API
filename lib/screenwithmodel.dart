import 'package:flutter/material.dart';
import 'api_services.dart';
import 'package:api/single_post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  SinglePostModel singlePostModel = SinglePostModel();

  _getSinglePost() {
    setState(() {
      isReady = true;
    });

    apiservice().getSinglePostWithModel().then((value) {
      setState(() {
        if (value != null) {
          singlePostModel = value;
        }
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getSinglePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("with Model Single Data"),
      ),
      body: isReady
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              singlePostModel.userId.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              singlePostModel.title.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Text(
              singlePostModel.body.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
