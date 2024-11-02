import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/constants/image_paths.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({
    super.key,
  });

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceInDown(
          from: 1000,
          duration: const Duration(seconds: 2),
          child: Image.asset(ImagePaths.logo),
        ),
      ),
    );
  }
}
