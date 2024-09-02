import 'package:find_out_flutter/widgets/app_text.dart';
import 'package:find_out_flutter/widgets/profile_card.dart';
import 'package:find_out_flutter/widgets/travel_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_large_text.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class AddTravelPage extends StatefulWidget {
  const AddTravelPage({super.key});

  @override
  State<AddTravelPage> createState() => _AddTravelState();
}

class _AddTravelState extends State<AddTravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLargeText(text: "Share your experience!"),
                    SizedBox(height: 10),
                    AppText(
                      text: "Select your destination",
                      size: 16,
                      color: Color(0xFF737373),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), 
            AddNewCard(), 
          ],
        ),
      ),
    );
  }
}

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add New',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 24.0,
              color: Colors.grey[600],
            ),
            onPressed: () {
              context.go('/addDestination'); 
            },
          )
        ],
      ),
    );
  }
}
