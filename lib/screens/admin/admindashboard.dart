import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/Auditlogspage.dart';
import 'package:restopos/screens/admin/usermanagementpage.dart';
import 'package:restopos/screens/admin/Inventorypage.dart';
import 'package:restopos/screens/admin/Viewreportspage.dart';
import 'package:restopos/screens/admin/pospage.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  @override
  _admindashboardState createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  Widget _currentPage = Center(child: Text('Admin Dashboard Content'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
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
              title: Text('POS'),
              onTap: () {
                setState(() {
                  _currentPage = pospage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                setState(() {
                  _currentPage = Inventorypage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('User Management'),
              onTap: () {
                setState(() {
                  _currentPage = usermanagementpage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Audit Logs'),
              onTap: () {
                setState(() {
                  _currentPage = Auditlogspage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('View Reports'),
              onTap: () {
                setState(() {
                  _currentPage = Viewreportspage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentPage = Center(child: Text('Admin Dashboard Content'));
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
