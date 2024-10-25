import 'package:flutter/material.dart';

import '../utils/assets_manager/image_paths.dart';

AppBar customAppBar() {
    return AppBar(
      title: Image.asset(
        ImagePaths.logo,
        scale: 2,
      ),
    );
  }
  
  