import 'dart:ui';

import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:find_out_flutter/widgets/app_text.dart';
import 'package:find_out_flutter/widgets/profile_card.dart';
import 'package:find_out_flutter/widgets/travel_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_large_text.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

final List<String> listCountry = <String>['Brasil', 'EUA', 'Inglaterra'];
final List<String> listState = <String>[
  'Flórida',
  'Espirito Santo',
  'Inglaterra'
];

class AddDestinationPage extends StatefulWidget {
  const AddDestinationPage({super.key});

  @override
  State<AddDestinationPage> createState() => AddDestinationState();
}

class AddDestinationState extends State<AddDestinationPage> {
  String dropdownValue = listCountry.first;
  String dropdownValueState = listState.first;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/share'),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'New Destination',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTravelColors.greyApp,
                      elevation: 1,
                      fixedSize: const Size(128, 128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide.none,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 62,
                      weight: 3,
                      color: AppTravelColors.blueApp,
                    ))
              ],
            ),
            const SizedBox(height: 24),
            DropdownMenu<String>(
              initialSelection: listCountry.first,
              width: 325,
              label: const Text('Country'),
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  listCountry.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 24),
            DropdownMenu<String>(
              initialSelection: listState.first,
              width: 325,
              label: const Text('State'),
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValueState = value!;
                });
              },
              dropdownMenuEntries:
                  listState.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 24),
            DropdownMenu<String>(
              initialSelection: listState.first,
              width: 325,
              label: const Text('City'),
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValueState = value!;
                });
              },
              dropdownMenuEntries:
                  listState.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 325,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTravelColors.blueApp,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
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
