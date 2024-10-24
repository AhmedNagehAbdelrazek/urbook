import 'package:flutter/material.dart';
import 'package:urbook/core/utils/assets_manager/image_paths.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImagePaths.logo),
        ],
      ),
    );
  }
}
