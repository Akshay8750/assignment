import 'package:assignment/common_widgets/helper_widgets.dart';
import 'package:assignment/common_widgets/padding_helper.dart';
import 'package:assignment/features/home/home_controller.dart';
import 'package:assignment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/home/home_screen.dart';
import 'features/screens/cart_screen.dart';
import 'features/screens/search_screen.dart';
import 'features/screens/setting_screen.dart';
import 'features/screens/wishlist_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == 0 ? true : false,
      onPopInvoked: (value) {
        if (_selectedIndex != 0) {
          moveToHomeScreen();
        }
      },
      child: Scaffold(
        body: currentScreen(_selectedIndex, () {
          setState(() {
            _selectedIndex = 0;
          });
        }),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: const Offset(0, 8),
              child: Divider(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(
              height: 103.h,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                showUnselectedLabels: true,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: vector(Assets.iconsHome,
                        color: _selectedIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_rounded,
                        color: _selectedIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground),
                    label: "Wishlist",
                  ),
                  BottomNavigationBarItem(
                    icon: Transform.translate(
                      offset: const Offset(0, -12),
                      child: Container(
                          padding: padAll(value: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.normal)
                              ]),
                          child: vector(Assets.iconsCart2)),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded,
                        color: _selectedIndex == 3
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_rounded,
                        color: _selectedIndex == 4
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground),
                    label: "Setting",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentScreen(int index, VoidCallback onBackPress) {
    switch (index) {
      case 1:
        return const WishlistScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const SearchScreen();

      case 4:
        return const SettingScreen();

      default:
        return HomeScreen(controller: Get.find<HomeController>());
    }
  }

  void moveToHomeScreen() {
    setState(() {
      _selectedIndex = 0;
    });
  }
}
