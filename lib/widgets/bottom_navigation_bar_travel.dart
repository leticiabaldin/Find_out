import 'package:flutter/material.dart';

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
          icon: IconButton(
            icon: const Icon(
              Icons.home_max_outlined,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.airplanemode_active_rounded,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          label: 'travel',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.image_rounded,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          label: 'travel',
        ),
      ],
    );
  }
}
