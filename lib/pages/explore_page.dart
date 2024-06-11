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
                      AppText(
                        text: "Other Trips",
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 24),
                  children: const [
                    CardTravel(
                      titleCard: 'Paris | 06/06',
                      imageCard: AssetImage("assets/images/trip1.jpg"),
                    ),
                    CardTravel(
                      titleCard: 'Brasil | 07/09',
                      imageCard: AssetImage(
                        "assets/images/trip2.jpg",
                      ),
                    ),
                    CardTravel(
                      titleCard: 'New York | 23/07',
                      imageCard: AssetImage(
                        "assets/images/trip3.jpg",
                      ),
                    ),
                    CardTravel(
                      titleCard: 'New Zealand | 09/04',
                      imageCard: AssetImage("assets/images/trip4.jpg"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
