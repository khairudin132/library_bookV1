import 'package:flutter/material.dart';
import 'package:library_book/screen/signup/localwidget/signup_form.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () => {Navigator.of(context).pop()},
                          child: Icon(Icons.arrow_back)),
                    ],
                  ),
                  SizedBox(height: 40),
                  SignUpForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
