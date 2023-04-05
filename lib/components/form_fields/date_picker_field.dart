import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_book/components/form_fields/form_fields.dart';

class LibraryDatePickerTextField extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryDatePickerTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final String labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<LibraryDatePickerTextField> createState() =>
      _LibraryDatePickerTextFieldState();
}

class _LibraryDatePickerTextFieldState
    extends State<LibraryDatePickerTextField> {
  final _controller = TextEditingController();

  // ------------------------------- FIELDS ------------------------------------

  @override
  Widget build(BuildContext context) {
    return LibraryTextField(
      controller: _controller,
      labelText: widget.labelText,
      readOnly: true,
      prefixIcon: const Icon(Icons.date_range),
      suffixIcon: _controller.value.text.isNotEmpty
          ? IconButton(
              onPressed: () => setState(() {
                _controller.clear();
              }),
              icon: const Icon(Icons.clear),
            )
          : null,
      onTap: () async {
        final value = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
          confirmText: 'Confirm',
        );

        if (value != null) {
          setState(() {
            _controller.text = DateFormat('dd-MM-yyyy').format(value);
          });
        }
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
