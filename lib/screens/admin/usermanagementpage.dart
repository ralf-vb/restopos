import 'package:flutter/material.dart';

class Account {
  String accountName;
  String password;
  String firstName;
  String lastName;
  String address;
  int age;

  Account({
    required this.accountName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.age,
  });
}

class usermanagementpage extends StatefulWidget {
  const usermanagementpage({Key? key}) : super(key: key);

  @override
  _usermanagementpageState createState() => _usermanagementpageState();
}

class _usermanagementpageState extends State<usermanagementpage> {
  List<Account> accounts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: [
          const SizedBox(height: 16.00),
          ElevatedButton(
            onPressed: () {
              _showAddAccountDialog();
            },
            child: Text('Add Account'),
          ),
          SizedBox(height: 16.0),
          if (accounts.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  title: Text(account.accountName),
                  subtitle: Text(account.password),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      _showAccountDetails(account);
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  void _showAddAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String newAccountName = '';
        String newPassword = '';
        String newFirstName = '';
        String newLastName = '';
        String newAddress = '';
        int newAge = 0;

        return AlertDialog(
          title: Text('Add Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newAccountName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Account Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPassword = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newFirstName = value;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newLastName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newAddress = value;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newAge = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  accounts.add(Account(
                    accountName: newAccountName,
                    password: newPassword,
                    firstName: newFirstName,
                    lastName: newLastName,
                    address: newAddress,
                    age: newAge,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showAccountDetails(Account account) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Account Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Account Name: ${account.accountName}'),
              Text('Password: ${account.password}'),
              Text('First Name: ${account.firstName}'),
              Text('Last Name: ${account.lastName}'),
              Text('Address: ${account.address}'),
              Text('Age: ${account.age}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
