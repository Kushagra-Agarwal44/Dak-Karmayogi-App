import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:dak_karmayogi_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:dak_karmayogi_app/features/auth/presentation/screens/login_page.dart';
import 'package:dak_karmayogi_app/features/courses/domain/entities/course.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/pages/course_details_page.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/pages/courses_page.dart';
import 'package:dak_karmayogi_app/features/explore/pages/explore_page.dart';
import 'package:dak_karmayogi_app/features/home/presentation/pages/dashboard_page.dart';
import 'package:dak_karmayogi_app/features/home/presentation/shell/main_shell.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // FIX: Create the router once. Do not use ref.watch here.
  final router = GoRouter(
    initialLocation: '/login',

    redirect: (context, state) {
      // FIX: Use ref.read to check the current state when a navigation occurs
      final authState = ref.read(authControllerProvider);

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

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/course-details',
        builder: (context, state) {
          final course = state.extra as Course;
          return CourseDetailsPage(course: course);
        },
      ),
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

  // FIX: Listen to the auth state independently and trigger a router refresh
  // This safely redirects the user without destroying the router instance
  ref.listen<AuthState>(authControllerProvider, (previous, next) {
    router.refresh();
  });

  return router;
});
