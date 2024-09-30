import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../colors/colors_travel.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class ListCountriesPage extends StatefulWidget {
  const ListCountriesPage({super.key});

  @override
  State<ListCountriesPage> createState() => _ListCountriesPageState();
}

class _ListCountriesPageState extends State<ListCountriesPage> {
  bool loading = false;
  List<dynamic> occurrences = [];

  // Função para buscar os dados do Firestore para o país específico
  Future<void> getOccurrences(String countryName) async {
    setState(() => loading = true);

    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection("paises");

    // Consultar apenas os documentos onde o país é igual ao passado
    final result = await collection.where('country', isEqualTo: countryName).get();

    final occurrences = result.docs.map((doc) => doc.data()).toList();

    setState(() {
      this.occurrences = occurrences;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Recuperar o nome do país passado como parâmetro na navegação
    final countryName = GoRouterState.of(context).extra as String?;

    print("TESTEEEEE: $countryName");

    if (countryName != null && occurrences.isEmpty && !loading) {
      getOccurrences(countryName);
    }

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 120, right: 24, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/share'),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                const SizedBox(width: 32),
                Text(
                  countryName ?? 'Country', // Exibir o nome do país recebido
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Verifica se está carregando ou exibe os dados
            loading
                ? const CircularProgressIndicator()
                : Column(
                    children: occurrences.map((occurrence) {
                      return Column(
                        children: [
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
                              context.go('/addExperience', extra: countryName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  occurrence['city'] ?? 'Unknown City',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppTravelColors.blueApp),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 24.0,
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16), // Adiciona o espaçamento entre os cards
                        ],
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
