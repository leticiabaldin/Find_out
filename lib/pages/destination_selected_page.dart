import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../colors/colors_travel.dart';
import '../widgets/bottom_navigation_bar_travel.dart';
import 'add_destination_travel_page.dart';

class DestinationSelectedPage extends StatefulWidget {
  const DestinationSelectedPage({super.key});

  @override
  State<DestinationSelectedPage> createState() => _DestinationSelectedPageState();
}

class _DestinationSelectedPageState extends State<DestinationSelectedPage> {
  String dropdownValue = listCountry.first;
  String dropdownValueState = listState.first;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                Container(
                  alignment: Alignment.center,
                  width: 128,
                  height: 128,
                  child: Image.asset('assets/images/flag-grecia.png', fit: BoxFit.fill,),
                ),
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
                onPressed: () => context.go('/success'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTravelColors.blueApp,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  'Confirm',
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
