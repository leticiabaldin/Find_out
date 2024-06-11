import 'package:find_out_flutter/pages/create_account_page.dart';
import 'package:find_out_flutter/pages/explore_page.dart';
import 'package:find_out_flutter/pages/home_page.dart';
import 'package:find_out_flutter/pages/login_page.dart';
import 'package:find_out_flutter/pages/profile_page.dart';
import 'package:find_out_flutter/pages/team_page.dart';
import 'package:find_out_flutter/pages/travel_page.dart';
import 'package:find_out_flutter/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
        GoRoute(
          path: 'travel',
          builder: (BuildContext context, GoRouterState state) {
            return const TravelPage();
          },
        ),
        GoRoute(
          path: 'explorer',
          builder: (BuildContext context, GoRouterState state) {
            return const ExplorerPage();
          },
        ),
        GoRoute(
          path: 'team',
          builder: (BuildContext context, GoRouterState state) {
            return const TeamPage();
          },
        ),
        GoRoute(
          path: 'createAccount',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountPage();
          },
        )
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: const Color(0XFFFFFFFF),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
