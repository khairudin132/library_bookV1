import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_book/components/components.dart';
import 'package:provider/provider.dart';

import '../../states/current_user.dart';

@RoutePage(name: 'SignUpPageRoute')
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => {Navigator.of(context).pop()},
                    child: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(height: 40),
            _SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  _SignUpForm({super.key});

  // ------------------------------- PROPERTIES --------------------------------

  // ------------------------------- FIELDS ------------------------------------
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signUpUser(String email, String password, String fullName,
      BuildContext context) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String returnString =
          await currentUser.signUpUser(email, password, fullName);
      if (returnString == "success") {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(returnString),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          LibraryTextField(
            controller: _fullNameController,
            labelText: 'Full Name',
            hintText: 'Full Name',
            prefixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 20),
          LibraryEmailTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Email',
          ),
          const SizedBox(height: 20),
          LibraryPasswordTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Password',
          ),
          const SizedBox(height: 20),
          LibraryPasswordTextField(
            controller: _confirmPasswordController,
            labelText: 'Password',
            hintText: 'Password',
          ),
          const SizedBox(height: 20),
          LibrarySubmitButton(
            label: 'Sign Up',
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(_emailController.text, _passwordController.text,
                    _fullNameController.text, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
