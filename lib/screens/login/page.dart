import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_book/router/router.gr.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../states/current_user.dart';

@RoutePage(name: 'LoginPageRoute')
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset("images/books.png"),
            ),
            const SizedBox(height: 20.0),
            _LoginForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  _LoginForm({super.key});

  // ------------------------------- PROPERTIES --------------------------------

  // ------------------------------- FIELDS ------------------------------------
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String? result;

      result = await currentUser
          .loginUserWithEmail(email, password)
          .whenComplete(() {
        if (result == 'success') {
          context.router.replaceAll([const HomePageRoute()]);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result ?? ''),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      });
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
              'Log in',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          LibrarySubmitButton(
            label: 'Log In',
            onPressed: () {
              _loginUser(
                  _emailController.text, _passwordController.text, context);
            },
          ),
          LibraryTextButton(
            label: 'Don\'t have an account? Sign up here',
            onPressed: () => context.router.push(const SignUpPageRoute()),
          ),
        ],
      ),
    );
  }
}
