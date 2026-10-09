import 'package:android/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),

    // GoRoute(
    //   path: '/search',
    //   builder: (context, state) => HomeScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/setting',
    //   builder: (context, state) => HomeScreen(),
    // ),
  ],
);
