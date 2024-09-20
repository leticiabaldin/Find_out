import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors_travel.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class ListCountriesPage extends StatefulWidget {
  const ListCountriesPage({super.key});

  @override
  State<ListCountriesPage> createState() => _ListCountriesPageState();
}

class _ListCountriesPageState extends State<ListCountriesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24,top:120,right: 24,bottom: 0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/listCountries'),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                const SizedBox(
                  width: 32,
                ),
                const Text(
                  'England',
                  style:
                  TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 1,
                fixedSize: const Size(325, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide.none,
                ),
              ),
              onPressed: () {
                context.go('/addExperience');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'England',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTravelColors.blueApp),
                  ),
                  Icon(
                    Icons.airplane_ticket,
                    size: 24.0,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 1,
                fixedSize: const Size(325, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide.none,
                ),
              ),
              onPressed: () {
                context.go('/addExperience');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'England',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTravelColors.blueApp),
                  ),
                  Icon(
                    Icons.airplane_ticket,
                    size: 24.0,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
