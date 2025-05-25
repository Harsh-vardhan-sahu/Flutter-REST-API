
import 'dart:convert';

import 'package:api/single_post_model.dart';
import 'package:http/http.dart' as http;

import 'listmodel.dart';
class apiservice{
  //with model
  Future<SinglePostModel?> getSinglePostWithModel()async{
    try{
      var url=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response= await http.get(url);
      if(response.statusCode==200||response.statusCode==201){
        SinglePostModel model=SinglePostModel.fromJson(json.decode(response.body));
        return model;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
}

  Future<dynamic> getSinglePostWithoutModel()async{
    try{
      var url=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response= await http.get(url);
      if(response.statusCode==200){
        final body=response.body;
        final data=jsonDecode(body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<List<Listmodel>?> getPostWithmodel()async{
    try{
      var response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode==200){
        List<Listmodel> model=List<Listmodel>.from(json.decode(response.body).map((x)=>Listmodel.fromJson(x)));
      return model;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<dynamic> getPostWithoutmodel()async{
    try{
      var response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode==200){
        final model=jsonDecode(response.body);
        return model;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}