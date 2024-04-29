import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:find_out_flutter/widgets/bottom_navigation_bar_travel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/dialog_travel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const DialogTravel();
    },
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing:
            -34, // Adicione esta linha para alinhar o texto completamente à esquerda
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Hi, Letícia Baldin!',
            style: TextStyle(
              color: AppTravelColors.blueApp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(
              Icons.exit_to_app_outlined,
              size: 32,
              color: AppTravelColors.blueApp,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLargeText(text: "Welcome Page"),
                    AppText(
                      text: "Travel App",
                      size: 28,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 360,
                      child: AppText(
                        text:
                            "Mountain hikes give you an incredible sense of freedom along with endurance test.",
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () => _dialogBuilder(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64,
                              vertical: 12,
                            ),
                            backgroundColor: AppTravelColors.blueApp,
                          ),
                          child: const Text(
                            'Add New Travel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),
                    const Text(
                      'Explore other places',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTravelColors.blueApp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
