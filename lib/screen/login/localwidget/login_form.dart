import 'package:flutter/material.dart';
import 'package:library_book/screen/home_screen.dart';
import 'package:library_book/screen/signup/signup.dart';
import 'package:library_book/states/current_user.dart';
import 'package:library_book/widget/shadow_container.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.loginUserWithEmail(email, password);
      if (_returnString == 'success') {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
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
              'Log in',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          RaisedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: () {
              _loginUser(
                  _emailController.text, _passwordController.text, context);
            },
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text(
              'Don\'t have an account? Sign up here',
            ),
          ),
        ],
      ),
    );
  }
}
