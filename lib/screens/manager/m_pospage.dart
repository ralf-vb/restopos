import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/pospage.dart';

class m_pospage extends StatelessWidget {
  const m_pospage({Key? key}) : super(key: key);

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