
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:android/utils/constant.dart';

class NavigationAppBar extends StatefulWidget {
  const NavigationAppBar({
    required this.shell,
    super.key,
  });

  final StatefulNavigationShell shell;

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  final List<int> _tabHistory = [0];

  void _onTabSelected(int index) {
    final currentIndex = widget.shell.currentIndex;

    if (index == currentIndex) {
      widget.shell.goBranch(
        index,
        initialLocation: true,
      );
      return;
    }

    _tabHistory.add(index);

    widget.shell.goBranch(index);
  }

  void _onBack() {
    if (_tabHistory.length > 1) {
      setState(() {
        _tabHistory.removeLast();
      });

      widget.shell.goBranch(_tabHistory.last);
      return;
    }

    if (widget.shell.currentIndex != 0) {
      setState(() {
        _tabHistory
          ..clear()
          ..add(0);
      });

      widget.shell.goBranch(0);
      return;
    }

    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _onBack();
        }
      },
      child: Scaffold(
        body: widget.shell,
        bottomNavigationBar: NavigationBar(
          backgroundColor: AppColors.surface,
          selectedIndex: widget.shell.currentIndex,
          onDestinationSelected: _onTabSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_rounded),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
