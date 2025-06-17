import 'package:flutter/material.dart';

class ObscuredTextField extends StatefulWidget {
  const ObscuredTextField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<ObscuredTextField> createState() => _ObscuredTextFieldState();
}

class _ObscuredTextFieldState extends State<ObscuredTextField> {
  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
    );
  }
}
