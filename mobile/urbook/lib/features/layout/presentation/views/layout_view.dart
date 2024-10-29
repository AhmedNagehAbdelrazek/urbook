import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/features/categories/presentation/pages/categories_view.dart';
import 'package:urbook/features/home/presentation/pages/home_view.dart';
import 'package:urbook/features/my_cart/presentation/pages/my_cart_view.dart';
import 'package:urbook/features/profile/presentation/pages/profile_view.dart';
import 'package:urbook/features/wish_list/presentation/pages/wish_list_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _getSelectedPage(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            _onItemTapped(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(IconPaths.home),
              ),
              label: "home".tr(),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(IconPaths.category),
              ),
              label: "categories".tr(),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(IconPaths.shoppingCart),
              ),
              label: "my_card".tr(),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(IconPaths.heart),
              ),
              label: " wishList".tr(),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(IconPaths.profile),
              ),
              label: "profile".tr(),
            ),
          ],
        ));
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const CategoriesView();
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
}
