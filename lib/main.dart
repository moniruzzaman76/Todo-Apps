import 'package:flutter/material.dart';
import 'package:to_do/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ToDoScreen(),

      themeMode: ThemeMode.system,

      theme: ThemeData(
          brightness:Brightness.light,
          primarySwatch: Colors.green
      ),

      darkTheme: ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.pink,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.grey
        )
      ),
    );
  }
}
