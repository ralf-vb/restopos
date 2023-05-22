import 'package:flutter/material.dart';

class c_payrollpage extends StatefulWidget {
  const c_payrollpage({Key? key}) : super(key: key);

  @override
  _c_payrollpageState createState() => _c_payrollpageState();
}

class _c_payrollpageState extends State<c_payrollpage> {
  String payrollInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  payrollInput = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Payroll',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Process the payroll input here
                print('Payroll: $payrollInput');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
