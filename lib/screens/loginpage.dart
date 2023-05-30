import 'package:flutter/material.dart';
import 'package:restopos/screens/admin/admindashboard.dart';
import 'package:restopos/screens/cashier/cashierdashboard.dart';
import 'package:restopos/screens/manager/managerdashboard.dart';
import 'package:restopos/screens/registrationpage.dart';
import 'package:restopos/screens/forgotpassword.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color here
      body: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pbackground2.jpeg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Replace with your image path
                    width: 200,
                    height: 200,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.00),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform login logic here using _emailController.text and _passwordController.text
                        if (_emailController.text == 'superadmin@gmail.com' && _passwordController.text == 'superadmin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => admindashboard()),
                          );
                        } else if (_emailController.text == 'manager@gmail.com' && _passwordController.text == 'manager') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => managerdashboard()),
                          );
                        } else if (_emailController.text == 'cashier@gmail.com' && _passwordController.text == 'cashier') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cashierdashboard()),
                          );
                        } else {
                          // Handle invalid credentials
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Invalid Credentials'),
                                content: Text('Please enter valid credentials.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[300]!), // Change the color here
                      minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)), // Adjust the width and height as needed
                    ),
                    child: const Text('Login'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dont Have Account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => registrationpage()),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change the color here
                        ),
                        child: const Text('Register >'),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigation logic here
                      // For example, you can use Navigator.push to go to another page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forgotpassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.red[200],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
