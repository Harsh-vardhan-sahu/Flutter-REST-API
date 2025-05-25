import 'package:api/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePost;
  bool isready=false;
  _getSinglePostWithoutModel(){
    isready=true;
    apiservice().getSinglePostWithModel().then((value){
      setState(() {

        singlePost=value;
        isready=false;
      });
    }).onError((error,stackTrace){
      isready=false;
      print(error);
    });
  }

  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Without Model Screen"),

      ),
      body: isready==true?
          const Center(child: CircularProgressIndicator(),):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(singlePost["userId"].toString(),style: TextStyle(color:Colors.blue),),
              Text(singlePost["title"].toString(),style: TextStyle(color:Colors.red),),
              Text(singlePost["body"].toString(),style: TextStyle(color:Colors.yellow),),
            ],
          )
    );
  }
}
