import 'package:flutter/material.dart';

class LibraryTextField extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryTextField({
    super.key,
    this.controller,
    this.onTap,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onFieldSubmitted,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final String labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
