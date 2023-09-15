import 'package:go_router/go_router.dart';
import 'package:onboarding/screens/go_router/activity_screen.dart';
import 'package:onboarding/screens/go_router/search_screen.dart';
import 'package:onboarding/screens/home_screen.dart';
import 'package:onboarding/screens/privacy_screen.dart';
import 'package:onboarding/screens/settings_screen.dart';

import '../user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: "/activity",
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const UserProfileScreen(),
    ),
    GoRoute(
      path: "/settings",
      name: "settings",
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          name: "privacy",
          path: "privacy",
          builder: (context, state) => const PrivacyScreen(),
        )
      ],
    ),
  ],
);
