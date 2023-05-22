import 'package:flutter/material.dart';
import 'package:restopos/screens/manager/m_auditlogspage.dart';
import 'package:restopos/screens/manager/m_inventorypage.dart';
import 'package:restopos/screens/manager/m_pospage.dart';
import 'package:restopos/screens/manager/m_viewreportspage.dart';

class managerdashboard extends StatefulWidget {
  const managerdashboard({Key? key}) : super(key: key);

  @override
  _managerdashboardState createState() => _managerdashboardState();
}

class _managerdashboardState extends State<managerdashboard> {
  Widget _currentPage = Center(child: Text('Manager Dashboard Content'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Admin Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Pos'),
              onTap: () {
                setState(() {
                  _currentPage = m_pospage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                setState(() {
                  _currentPage = m_inventorypage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Audit Logs'),
              onTap: () {
                setState(() {
                  _currentPage = m_auditlogspage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('View Reports'),
              onTap: () {
                setState(() {
                  _currentPage = m_viewreportspage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentPage = Center(child: Text('Manager Dashboard Content'));
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
