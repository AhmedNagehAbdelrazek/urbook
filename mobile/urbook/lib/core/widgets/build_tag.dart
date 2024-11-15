import 'package:flutter/material.dart';

Widget buildTag(BuildContext context,
    {required String text, required Color color}) {
  var theme = Theme.of(context);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: theme.textTheme.bodyMedium!.copyWith(
        color: color,
      ),
    ),
  );
}
