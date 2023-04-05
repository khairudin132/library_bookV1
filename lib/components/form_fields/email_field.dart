import 'package:flutter/material.dart';
import 'package:library_book/components/form_fields/form_fields.dart';

class LibraryEmailTextField extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryEmailTextField({
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

  // ------------------------------- FIELDS ------------------------------------
  @override
  Widget build(BuildContext context) {
    return LibraryTextField(
      controller: controller,
      labelText: labelText,
      prefixIcon: const Icon(Icons.email),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
