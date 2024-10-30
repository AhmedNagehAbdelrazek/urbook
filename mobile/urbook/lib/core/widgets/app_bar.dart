import 'package:flutter/material.dart';

import '../constants/image_paths.dart';

AppBar customAppBar({List<Widget>? actions}) {
  return AppBar(
      title: Image.asset(
        ImagePaths.logo,
        scale: 2,
      ),
      actions: actions);
}
