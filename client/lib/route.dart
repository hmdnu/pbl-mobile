import 'package:client/screens/home_screen.dart';
import 'package:client/screens/login_screen.dart';
import 'package:client/screens/profile_screen.dart';
<<<<<<< HEAD
=======
import 'package:client/screens/change_password_screen.dart';
import 'package:client/screens/register_screen.dart';
import 'package:client/services/auth_service.dart';
import 'package:client/widgets/navbar_admin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e
import 'package:go_router/go_router.dart';

final storage = FlutterSecureStorage();

final GoRouter router = GoRouter(
  initialLocation: "/login",
  redirect: (context, state) {
    return;
  },
  routes: [
<<<<<<< HEAD
=======
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavbarAdmin(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/admin",
              builder: (context, state) => const AdminScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/admin/employee",
              builder: (context, state) => const EmployeeScreen(),
            ),
            GoRoute(
              path: "/admin/profile-detail",
              builder: (context, state) {
                return ProfileScreen(userId: state.extra as int);
              },
            ),
            GoRoute(
              path: "/admin/register",
              builder: (context, state) => const RegisterScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/admin/profile",
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavbarUser(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/profile",
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e
    GoRoute(
      path: "/",
      name: "home",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/profile_info",
      name: "profileinfo",
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);