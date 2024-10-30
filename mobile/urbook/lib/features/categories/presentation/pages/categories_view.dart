import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),
      body: const Center(
          child: Text(
        "Categories View",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
