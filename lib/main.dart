import 'package:find_out_flutter/pages/add_destination_travel_page.dart';
import 'package:find_out_flutter/pages/add_experience_page.dart';
import 'package:find_out_flutter/pages/destination_selected_page.dart';
import 'package:find_out_flutter/pages/list_countries_page.dart';
import 'package:find_out_flutter/pages/share_travel_page.dart';
import 'package:find_out_flutter/pages/create_account_page.dart';
import 'package:find_out_flutter/pages/explore_page.dart';
import 'package:find_out_flutter/pages/home_page.dart';
import 'package:find_out_flutter/pages/login_page.dart';
import 'package:find_out_flutter/pages/profile_page.dart';
import 'package:find_out_flutter/pages/success_page.dart';
import 'package:find_out_flutter/pages/team_page.dart';
import 'package:find_out_flutter/pages/travel_page.dart';
import 'package:find_out_flutter/pages/welcome_page.dart';
import 'package:find_out_flutter/pages/select_image_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';


import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FilePicker.platform;
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
          path: 'share',
          builder: (BuildContext context, GoRouterState state) {
            return const AddTravelPage();
          },
        ),
        GoRoute(
          path: 'addDestination',
          builder: (BuildContext context, GoRouterState state) {
            return const AddDestinationPage();
          },
        ),
        GoRoute(
          path: 'destinationSelected',
          builder: (BuildContext context, GoRouterState state) {
            return const DestinationSelectedPage();
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
        ),
        GoRoute(
          path: 'success',
          builder: (BuildContext context, GoRouterState state) {
            return const SuccessPage();
          },
        ),
        GoRoute(
          path: 'listCountries',
          builder: (BuildContext context, GoRouterState state) {
            return const ListCountriesPage();
          },
        ),
        GoRoute(
          path: 'selectImage',
          builder: (BuildContext context, GoRouterState state) {
            return FileUploadScreen();
          },
        ),
        GoRoute(
          path: 'addExperience',
          builder: (BuildContext context, GoRouterState state) {
            // Captura o valor de 'countryName' passado na navegação
            final countryName = state.extra as String? ?? ''; // Verifica se o valor é nulo e define como vazio se for

            return AddExperiencePage(countryName: countryName);
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
      debugShowCheckedModeBanner: false,
    );
  }
}
