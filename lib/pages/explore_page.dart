import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar_travel.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigatorBarTravel(),
      body: Column(
        children: [
          Text('Explore page')
        ],
      ),
    );
  }
}
