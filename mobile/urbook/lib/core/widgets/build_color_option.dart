import 'package:flutter/material.dart';

Widget buildColorOption(Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: CircleAvatar(
      backgroundColor: color,
      radius: 12,
    ),
  );
}
