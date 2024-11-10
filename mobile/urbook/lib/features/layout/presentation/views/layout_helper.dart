import 'package:flutter/material.dart';
import 'package:urbook/core/routes/app_views.dart';
import 'package:urbook/features/categories/presentation/pages/categories_page.dart';

Widget getSelectedPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const CategoriesPage();
      case 2:
        return const MyCartView();
      case 3:
        return const WishListView();
      case 4:
        return const ProfileView();
      default:
        return const Text("Home Page");
    }
  }