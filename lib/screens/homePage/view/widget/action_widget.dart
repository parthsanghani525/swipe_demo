import 'package:flutter/material.dart';

Widget actionDialog(String? title) {
  return AlertDialog(
    content: Text(
      title ?? '',
      style: const TextStyle(fontSize: 18),
    ),
  );
}
