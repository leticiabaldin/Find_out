import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:find_out_flutter/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar_travel.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: "You don't have any travels yet :(",
              size: 16,
              color: AppTravelColors.blueApp,
            ),
            Image.asset('assets/images/emptyState.png'),
          ],
        ),
      ),
    );
  }
}
