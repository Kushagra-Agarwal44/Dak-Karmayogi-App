import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:dak_karmayogi_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:dak_karmayogi_app/features/auth/presentation/screens/login_page.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/pages/courses_page.dart';
import 'package:dak_karmayogi_app/features/explore/pages/explore_page.dart';
import 'package:dak_karmayogi_app/features/home/presentation/pages/dashboard_page.dart';
import 'package:dak_karmayogi_app/features/home/presentation/shell/main_shell.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);
// final routerProvider = Provider<GoRouter>((ref) {
//   final authNotifier = ref.watch(authControllerProvider.notifier);

  return GoRouter(
    initialLocation: '/login',

    redirect: (context, state) {
      // If loading (initial or loading), don't redirect yet
      if (authState.isLoading) return null;

      final isLoggedIn = authState.isAuthenticated;
      final isGoingToLogin = state.matchedLocation == '/login';
      // Not logged in → force login
      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }
      // Not logged in → force login
      if (isLoggedIn && isGoingToLogin) {
        return '/dashboard';
      }

      return null;
    },


//  return GoRouter(
//     initialLocation: '/login',
//     refreshListenable: GoRouterRefreshStream(
//       authNotifier.stream,
//     ),
//     redirect: (context, state) {
//       final authState = ref.read(authControllerProvider);

//       if (authState.isLoading) return null;

//       final isLoggedIn = authState.isAuthenticated;
//       final isGoingToLogin = state.matchedLocation == '/login';

//       if (!isLoggedIn && !isGoingToLogin) {
//         return '/login';
//       }

//       if (isLoggedIn && isGoingToLogin) {
//         return '/dashboard';
//       }

//       return null;
//     },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),

      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardPage(),
          ),

          GoRoute(
            path: '/courses',
            builder: (context, state) => const CoursesPage(),
          ),

          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExplorePage(),
          ),

          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});





// final routerProvider = Provider<GoRouter>((ref) {
//   final router = GoRouter(
//     initialLocation: '/login',
//     routes: [
//       GoRoute(
//         path: '/login',
//         builder: (context, state) => const LoginPage(),
//       ),
//       ShellRoute(
//         builder: (context, state, child) {
//           return MainShell(child: child);
//         },
//         routes: [
//           GoRoute(
//             path: '/dashboard',
//             builder: (context, state) => const DashboardPage(),
//           ),
//           GoRoute(
//             path: '/courses',
//             builder: (context, state) => const CoursesPage(),
//           ),
//           GoRoute(
//             path: '/explore',
//             builder: (context, state) => const ExplorePage(),
//           ),
//           GoRoute(
//             path: '/profile',
//             builder: (context, state) => const ProfilePage(),
//           ),
//         ],
//       ),
//     ],
//     redirect: (context, state) {
//       final authState = ref.read(authControllerProvider);

//       if (authState.isLoading) return null;

//       final isLoggedIn = authState.isAuthenticated;
//       final isGoingToLogin = state.matchedLocation == '/login';

//       if (!isLoggedIn && !isGoingToLogin) {
//         return '/login';
//       }

//       if (isLoggedIn && isGoingToLogin) {
//         return '/dashboard';
//       }

//       return null;
//     },
//   );

//   // 👇 THIS is the important part
//   ref.listen<AuthState>(authControllerProvider, (previous, next) {
//     router.refresh();
//   });

//   return router;
// });
