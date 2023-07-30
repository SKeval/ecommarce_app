// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Txt_Field extends StatefulWidget {
  TextEditingController controller;
  String hint;
  String label;
  bool isVisible;
  TextInputType keyboard;
  Txt_Field(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label,
      this.keyboard = TextInputType.text,
      this.isVisible = false});

  @override
  State<Txt_Field> createState() => _Txt_FieldState();
}

class _Txt_FieldState extends State<Txt_Field> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(10),
          hintText: widget.hint,
          labelText: widget.label,
        ),
        obscureText: widget.isVisible,
        keyboardType: widget.keyboard,
      ),
    );
  }
}
