import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page_one.dart';
import 'package:flutter_application_1/pages/todo_list.dart';
// import 'package:hive/hive.dart';

void main() async {
  // init the hive
  // await Hive.initFlutter();

  // await Hive.initFlutter();
// open a box
  // var box = await Hive.openBox('my box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const HomePage();
              },
            ),
          ),
          child: const Text(
            'HomePageOne',
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ToDoList();
              },
            ),
          ),
          child: const Text(
            'HomePageOne',
          ),
        ),
      ],
    );
  }
}
