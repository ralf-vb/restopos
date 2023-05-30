import 'package:flutter/material.dart';
import 'package:restopos/screens/manager/m_auditlogspage.dart';
import 'package:restopos/screens/manager/m_pospage.dart';
import 'package:restopos/screens/manager/m_viewreportspage.dart';

class managerdashboard extends StatefulWidget {
  const managerdashboard({Key? key}) : super(key: key);

  @override
  _managerdashboardState createState() => _managerdashboardState();
}

class _managerdashboardState extends State<managerdashboard> {
  String _appBarTitle = 'Manager Dashboard';
  Widget _currentPage = Center(child: Text('Manager Dashboard Content'));

  void _changePage(String title, Widget page) {
    setState(() {
      _appBarTitle = title;
      _currentPage = page;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
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
              onTap: () => _changePage('POS', m_pospage()),
            ),

            ListTile(
              title: Text('Audit Logs'),
              onTap: () => _changePage('Audit Logs', m_auditlogspage()),
            ),
            ListTile(
              title: Text('View Reports'),
              onTap: () => _changePage('View Reports', m_viewreportspage()),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => _changePage('Manager Dashboard', Center(child: Text('Manager Dashboard Content'))),
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
