import 'package:api/screenwithmodel.dart';
import 'package:api/screenwithoutmodel.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'listmodel_screen.dart';
import 'listwithoutmodel_screen.dart';
import 'modal_testing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
  debugShowCheckedModeBanner: false,
  home:TestScreen() ,
    );
  }
}

