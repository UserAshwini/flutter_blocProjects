import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  // final bool obscureText;
  final TextInputType? inputType;
  final void Function(String)? onChanged;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    // this.obscureText = false,
    this.suffixIcon,
    this.inputType,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle password visibility
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
