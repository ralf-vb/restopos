import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/Auditlogspage.dart';
import 'package:restopos/screens/admin/usermanagementpage.dart';
import 'package:restopos/screens/admin/Viewreportspage.dart';
import 'package:restopos/screens/admin/pospage.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  @override
  _admindashboardState createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  Widget _currentPage = Center(child: Text('Admin Dashboard Content'));
  PreferredSizeWidget? _currentAppBar = AppBar(title: const Text('Admin'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentAppBar,
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
                  _currentAppBar = AppBar(title: const Text('POS'));
                });
                Navigator.pop(context); // Close the drawer
              },
            ),

            ListTile(
              title: Text('User Management'),
              onTap: () {
                setState(() {
                  _currentPage = usermanagementpage();
                  _currentAppBar = AppBar(title: const Text('User Management'));
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Audit Logs'),
              onTap: () {
                setState(() {
                  _currentPage = Auditlogspage();
                  _currentAppBar = AppBar(title: const Text('Audit Logs'));
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('View Reports'),
              onTap: () {
                setState(() {
                  _currentPage = Viewreportspage();
                  _currentAppBar = AppBar(title: const Text('View Reports'));
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentPage = Center(child: Text('Admin Dashboard Content'));
                  _currentAppBar = AppBar(title: const Text('Admin'));
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
