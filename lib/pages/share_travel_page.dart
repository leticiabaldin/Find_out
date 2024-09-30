import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_out_flutter/entities/country.dart';
import 'package:find_out_flutter/widgets/app_text.dart';
import 'package:find_out_flutter/widgets/profile_card.dart';
import 'package:find_out_flutter/widgets/travel_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool loading = false;

  List<Country> occurrences = [];

  getOccurrences() async {
    final fireAuth = FirebaseAuth.instance;
    final user = fireAuth.currentUser;

    if (user == null || loading) return;
    setState(() => loading = true);

    final firestore = FirebaseFirestore.instance;
    // Conecta com a collection do Firestore
    final collection = firestore.collection("paises");

    final result = await collection.get();

    final occurrences = result.docs
        .map(
          (doc) => Country(
            doc.data()['city'],
            doc.data()['country'],
            doc.data()['state'],
          ),
        )
        .toList();

    setState(() {
      this.occurrences = occurrences;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getOccurrences();
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
            AddNewCard(), // Botão "Add New"
            SizedBox(height: 0),
            
            // Verifica se está carregando os dados
            loading
                ? CircularProgressIndicator() // Mostra um indicador de carregamento
                : Expanded(
                    child: ListView.builder(
                      itemCount: occurrences.length - 1,
                      itemBuilder: (context, index) {
                        final country = occurrences[index];
                        return CountryCard(country: country);
                      },
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
              context.go('/addDestination'); // Navegação para adicionar novo destino
            },
          )
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({required this.country});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega para a rota '/addExperience' quando o cartão for clicado
        context.go('/listCountries');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
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
            // Exibe o nome do país
            Text(
              country.country, // Nome do país
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.location_on,
              size: 24.0,
              color: Colors.grey[600],
            )
          ],
        ),
      ),
    );
  }
}

