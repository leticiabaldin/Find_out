import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  const BottomNavigationBarTravel({super.key});

  @override
  State<BottomNavigationBarTravel> createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: AppTravelColors.blueApp,
          icon: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 12),
            child: IconButton(
              icon: const Icon(
                Icons.home_max_outlined,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () => context.go('/home'),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.airplanemode_active_rounded,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.image_rounded,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.person,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () => context.go('/profile'),
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
