import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
   final int? maxLine;

  const CustomTextField({super.key, required this.hinText, required this.controller, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine ?? 1,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color:Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:Colors.green),
        ),
      ),

    );
  }
}