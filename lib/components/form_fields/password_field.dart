import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_book/components/form_fields/text_field.dart';

class LibraryPasswordTextField extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryPasswordTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<LibraryPasswordTextField> createState() =>
      _LibraryPasswordTextFieldState();
}

class _LibraryPasswordTextFieldState extends State<LibraryPasswordTextField> {
  // ------------------------------- FIELDS ------------------------------------
  bool obscureText = false;

  var showPassword = CupertinoIcons.eye_solid;

  var hidePassword = CupertinoIcons.eye_slash_fill;

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return LibraryTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: obscureText ? Icon(hidePassword) : Icon(showPassword),
      ),
      obscureText: obscureText,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
