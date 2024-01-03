import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/ToDoPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
// open a box
  var box = await Hive.openBox('myBox');

  //run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ));
  }
}
