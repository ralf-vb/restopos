import 'package:flutter/material.dart';
import 'package:restopos/screens/loginpage.dart';

void main() {
  runApp( MyHomePage(userId: 'userId',));
}

class MyHomePage extends StatefulWidget {
  final String userId; // Add the userId parameter

  const MyHomePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: loginpage(userId: widget.userId,),
    );
  }
}
