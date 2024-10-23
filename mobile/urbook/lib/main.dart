import 'package:flutter/material.dart';
import 'package:urbook/core/routes/app_router.dart';
import 'package:urbook/core/routes/page_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ur book',
      initialRoute: PageRouteName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

