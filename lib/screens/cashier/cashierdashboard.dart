import 'package:flutter/material.dart';
import 'package:restopos/screens/cashier/c_inventorypage.dart';
import 'package:restopos/screens/cashier/c_payrollpage.dart';
import 'package:restopos/screens/cashier/c_pospage.dart';


class cashierdashboard extends StatefulWidget {
  const cashierdashboard({Key? key}) : super(key: key);

  @override
  _cashierdashboardState createState() => _cashierdashboardState();
}

class _cashierdashboardState extends State<cashierdashboard> {
  Widget _currentPage = Center(child: Text('Cashier Dashboard Content'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashier'),
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
                  _currentPage = c_pospage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                setState(() {
                  _currentPage = c_inventorypage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Payroll'),
              onTap: () {
                setState(() {
                  _currentPage = c_payrollpage();
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentPage = Center(child: Text('Cashier Dashboard Content'));
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
