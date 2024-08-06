// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButtonW extends StatelessWidget {
  const MyButtonW({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
  });

  final void Function()? onPressed;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle()),
    );
  }
}
