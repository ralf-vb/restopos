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
  String _appBarTitle = 'Cashier Dashboard';
  Widget _currentPage = Center(child: Text('Cashier Dashboard Content'));

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
              title: Text('POS'),
              onTap: () => _changePage('POS', c_pospage()),
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () => _changePage('Inventory', c_inventorypage()),
            ),
            ListTile(
              title: Text('Payroll'),
              onTap: () => _changePage('Payroll', c_payrollpage()),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => _changePage('Cashier Dashboard', Center(child: Text('Cashier Dashboard Content'))),
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
