import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationAppBar  extends StatelessWidget {
  const NavigationAppBar ({required this.shell, super.key});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) {
            shell.goBranch(
              index,
              initialLocation: index == shell.currentIndex, 
            );
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.explore_rounded), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Settings'),
          ],
      ),
    );
  }
}

// import 'package:android/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class NavigationAppBar extends StatefulWidget {
//   const NavigationAppBar({super.key});
//
//   @override
//   State<NavigationAppBar> createState() => _NavigationAppBarState();
// }
//
// class _NavigationAppBarState extends State<NavigationAppBar> {
//   int currentPageIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//       selectedIndex: currentPageIndex,
//       indicatorColor: AppColors.primary,
//       onDestinationSelected: (int index) {
//         setState(() {
//           currentPageIndex = index;
//           }
//         );
//
//         switch (index) {
//           case 0:
//             context.go('/');
//             break;
//           case 1:
//             context.go('/search');
//             break;
//           case 2:
//             context.go('/setting');
//             break;
//         }
//       },
//       destinations: const <NavigationDestination>[
//         NavigationDestination(
//           selectedIcon: Icon(Icons.home),
//           icon: Icon(Icons.home_outlined),
//           label: 'Home',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.settings_outlined),
//           label: 'Setting',
//         ),
//       ],
//     );
//   }
// }
