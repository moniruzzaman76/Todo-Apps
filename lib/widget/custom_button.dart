import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const ReusableButton({
    super.key, required this.text, required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
          onPressed: onTab,
          child: Text(text,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),)),
    );
  }
}