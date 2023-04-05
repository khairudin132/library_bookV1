import 'package:flutter/material.dart';

class LibrarySubmitButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibrarySubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final String label;
  final VoidCallback onPressed;

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class LibraryTextButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final String label;
  final VoidCallback onPressed;

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
