import 'package:dak_karmayogi_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _getIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/courses')) return 1;
    if (location.startsWith('/explore')) return 2;
    if (location.startsWith('/profile')) return 3;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndex(context);

    return Scaffold(
      body: widget.child,
     bottomNavigationBar: Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        blurRadius: 12,
        color: Colors.black.withOpacity(0.2),
      )
    ],
  ),
  child: ClipRRect(
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    child: NavigationBar(
      height: 70,
      selectedIndex: currentIndex,

      // indicatorColor: const Color(0xffe6eef6),
      indicatorColor: AppColors.secondary,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/dashboard');
            break;
          case 1:
            context.go('/courses');
            break;
          case 2:
            context.go('/explore');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),
        NavigationDestination(
          icon: Icon(Icons.school_outlined),
          selectedIcon: Icon(Icons.school),
          label: "Courses",
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: "Explore",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    ),
  ),
)
    );
  }
}