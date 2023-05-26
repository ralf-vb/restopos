import 'package:flutter/material.dart';

class ViewReportAttempt {
  final String username;
  final String reportName;
  final String timestamp;

  ViewReportAttempt({
    required this.username,
    required this.reportName,
    required this.timestamp,
  });
}

class Viewreportspage extends StatelessWidget {
  final List<ViewReportAttempt> reportAttempts = [
    ViewReportAttempt(username: 'user1', reportName: 'Sales Report', timestamp: '2023-05-25 09:12:34'),
    ViewReportAttempt(username: 'user2', reportName: 'Inventory Report', timestamp: '2023-05-25 14:45:21'),
    ViewReportAttempt(username: 'user3', reportName: 'Profit Report', timestamp: '2023-05-26 10:22:15'),
    // Add more view report attempts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Username')),
              DataColumn(label: Text('Report Name')),
              DataColumn(label: Text('Timestamp')),
            ],
            rows: reportAttempts.map((attempt) {
              return DataRow(
                cells: [
                  DataCell(Text(attempt.username)),
                  DataCell(Text(attempt.reportName)),
                  DataCell(Text(attempt.timestamp)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
