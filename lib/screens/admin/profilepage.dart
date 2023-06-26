import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/api/user/'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        setState(() {
          userData = data;
        });
      } else {
        // Handle error response
      }
    } catch (e) {
      // Handle network error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text('Username: ${userData['username']}'),
                Text('First Name: ${userData['first_name']}'),
                Text('Middle Name: ${userData['middle_name']}'),
                Text('Last Name: ${userData['last_name']}'),
                Text('Email: ${userData['email']}'),
                Text('Contact Number: ${userData['contact_number']}'),
              ],
            ),
    );
  }
}
