import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/Auditlogspage.dart';
import 'package:restopos/screens/admin/cartpage.dart';
import 'package:restopos/screens/admin/Viewreportspage.dart';
import 'package:restopos/screens/admin/pospage.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  @override
  _admindashboardState createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {

  Widget _currentPage = Center(child: Text('Admin Dashboard Content'));
  PreferredSizeWidget? _currentAppBar = AppBar(
    title: const Text('Homepage'),
    backgroundColor: Colors.blue, // Set the background color of the AppBar
  );

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
                  'Main Menu',
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
                  _currentAppBar = AppBar(
                    title: const Text('POS',style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.blue[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                setState(() {
                  _currentPage = cartpage();
                  _currentAppBar = AppBar(
                    title: const Text('Cart',style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.red[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Audit Logs'),
              onTap: () {
                setState(() {
                  _currentPage = Auditlogspage();
                  _currentAppBar = AppBar(
                    title: const Text('Audit Logs',style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.yellow[300], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('View Reports'),
              onTap: () {
                setState(() {
                  _currentPage = Viewreportspage();
                  _currentAppBar = AppBar(
                    title: const Text('View Reports',style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.orange[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentPage = Center(child: Text('Admin Dashboard Content'));
                  _currentAppBar = AppBar(
                    title: const Text('Homepage'),
                    backgroundColor: Colors.blue, // Set the background color of the AppBar
                  );
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
