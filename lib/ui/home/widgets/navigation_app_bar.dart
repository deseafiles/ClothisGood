import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class NavigationAppBar extends StatefulWidget {
  const NavigationAppBar({super.key});

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: (int index) {
            setState(() {
                          currentPageIndex = index;
                        });
          },
          indicatorColor: AppColors.primary,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_rounded), 
              label: 'Home'
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded), 
              label: 'Search'
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_display_rounded), 
              label: 'Settings',
            )
          ],
      );
  }
}
