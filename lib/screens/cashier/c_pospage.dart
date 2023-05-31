import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/pospage.dart';

class c_pospage extends StatelessWidget {
  const c_pospage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: pospage(),
    );
  }
}