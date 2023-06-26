import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/Auditlogspage.dart';
import 'package:restopos/screens/admin/Viewreportspage.dart';
import 'package:restopos/screens/admin/pospage.dart';
import 'package:restopos/screens/admin/profilepage.dart';
import 'package:restopos/screens/loginpage.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  Widget _currentPage = Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Instructions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Follow these steps to get started...',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/instructions.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Press the image once to add in the cart',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/instructions3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Press the image twice to view the description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/instructions2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );

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
                    title: const Text('POS',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors
                        .blue[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            // ListTile(
            //   title: Text('Cart'),
            //   onTap: () {
            //     setState(() {
            //       _currentPage = cartpage();
            //       _currentAppBar = AppBar(
            //         title: const Text('Cart', style: TextStyle(color: Colors.black)),
            //         backgroundColor: Colors.red[100], // Set the background color of the AppBar
            //       );
            //     });
            //     Navigator.pop(context); // Close the drawer
            //   },
            // ),
            ListTile(
              title: Text('Audit Logs'),
              onTap: () {
                setState(() {
                  _currentPage = Auditlogspage();
                  _currentAppBar = AppBar(
                    title: const Text('Audit Logs',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors
                        .yellow[300], // Set the background color of the AppBar
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
                    title: const Text('View Reports',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors
                        .orange[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('User Profile'),
              onTap: () {
                setState(() {
                  _currentPage =
                      profilepage(); // Pass the userId to the profilepage widget
                  _currentAppBar = AppBar(
                    title: const Text('User Profile',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors
                        .blue[100], // Set the background color of the AppBar
                  );
                });
                Navigator.pop(context); // Close the drawer
              },
            ),

            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => loginpage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
