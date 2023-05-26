import 'package:flutter/material.dart';

class Auditlogspage extends StatelessWidget {
  final List<LoginAttempt> loginAttempts = [
    LoginAttempt(username: 'user1', timestamp: '2023-05-25 09:12:34', success: true),
    LoginAttempt(username: 'user2', timestamp: '2023-05-25 14:45:21', success: false),
    LoginAttempt(username: 'user3', timestamp: '2023-05-26 10:22:15', success: true),
    // Add more login attempts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(16.0),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Username')),
            DataColumn(label: Text('Timestamp')),
            DataColumn(label: Text('Success')),
          ],
          rows: loginAttempts.map((attempt) {
            return DataRow(
              cells: [
                DataCell(Text(attempt.username)),
                DataCell(Text(attempt.timestamp)),
                DataCell(
                  Icon(
                    attempt.success ? Icons.check : Icons.close,
                    color: attempt.success ? Colors.green : Colors.red,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class LoginAttempt {
  final String username;
  final String timestamp;
  final bool success;

  LoginAttempt({
    required this.username,
    required this.timestamp,
    required this.success,
  });
}
