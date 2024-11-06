import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/features/layout/presentation/views/layout_helper.dart';

class LayoutView extends StatefulWidget {
  final int initialIndex;
  const LayoutView({super.key, this.initialIndex = 0});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; 
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getSelectedPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(IconPaths.home)),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(IconPaths.category)),
            label: "categories".tr(),
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(IconPaths.shoppingCart)),
            label: "my_card".tr(),
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(IconPaths.heart)),
            label: "wishList".tr(),
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(IconPaths.profile)),
            label: "profile".tr(),
          ),
        ],
      ),
    );
  }
}
