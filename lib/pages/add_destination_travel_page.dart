import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:find_out_flutter/colors/colors_travel.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class AddDestinationPage extends StatefulWidget {
  const AddDestinationPage({super.key});

  @override
  State<AddDestinationPage> createState() => AddDestinationState();
}

class AddDestinationState extends State<AddDestinationPage> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final contryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  Future<void> createCountry() async {
    if (loading) return;
    setState(() => loading = true);
    final fireAuth = FirebaseAuth.instance;
    final id = fireAuth.currentUser!.uid;

    final firestore = FirebaseFirestore.instance;

    ScaffoldMessenger.of(context).clearSnackBars();

    final data = {
      "country": countryValue,
      "state": stateValue,
      "city": cityValue,
    };

    // Adiciona diretamente na coleção "paises"
    final collection = firestore.collection("paises/$id/history");
    await collection.add(data);

    setState(() => loading = false);
  }

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
                IconButton(
                  onPressed: () => context.go('/share'),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'New Destination',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 60),
            // Dropdowns dinâmicos de País, Estado e Cidade
            Form(
              key: formKey,
              child: Column(
                children: [
SelectState(
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                  stateValue = null;
                  cityValue = null;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  stateValue = value;
                  cityValue = null;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  cityValue = value;
                });
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 325,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  if (cityValue != null && stateValue != null && cityValue != null) {
                      createCountry();
                      context.go('/share');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTravelColors.blueApp,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
                ],
              )
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
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
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
          ),
        ],
      ),
    );
  }
}
