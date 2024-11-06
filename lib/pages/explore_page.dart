import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_out_flutter/entities/occurrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/bottom_navigation_bar_travel.dart';
import '../widgets/card_travel.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  bool loading = false;

  List<Occurrence> occurrences = [];

  getOccurrences() async {
    final fireAuth = FirebaseAuth.instance;
    final user = fireAuth.currentUser;

    if (user == null || loading) return;
    setState(() => loading = true);

    final id = user.uid;
    final firestore = FirebaseFirestore.instance;
    //conecta coma  collection do firebase
    final collection = firestore.collection("occurrences").orderBy(
          "date",
          descending: true,
        );

    final result = await collection.get();
    final occurrences = result.docs
        .map(
          (doc) => Occurrence(
            doc.data()['date'],
            doc.data()['description'],
            doc.id,
            doc.data()['place'],
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
        body: Container(
          margin: const EdgeInsets.only(
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
                    children: [
                      AppLargeText(text: "Explorer Page"),
                      SizedBox(height: 10),
                      AppText(
                        text: "My Trips",
                        size: 16,
                        color: Color(0xFF737373),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                  padding: const EdgeInsets.only(top: 24),
                  itemCount: occurrences.length,
                  itemBuilder: (context, index) {
                    final ocurrence = occurrences[index];
                    return CardTravel(
                      titleCard: '${ocurrence.place} | ${ocurrence.date}',
                      imageCard: const AssetImage("assets/images/trip1.jpg"),
                      description: ocurrence.description,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
