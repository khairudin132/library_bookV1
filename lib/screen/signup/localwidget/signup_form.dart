import 'package:flutter/material.dart';
import 'package:library_book/states/current_user.dart';
import 'package:library_book/widget/shadow_container.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, String fullName,
      BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: 'Full Name',
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open),
              hintText: 'Confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  _signUpUser(_emailController.text, _passwordController.text,
                      _fullNameController.text, context);
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Passwords do not match"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
