import 'package:find_out_flutter/widgets/app_text.dart';
import 'package:find_out_flutter/widgets/profile_card.dart';
import 'package:find_out_flutter/widgets/travel_list_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/app_large_text.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
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
        child: Column(children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLargeText(text: "Search page"),
                  SizedBox(height: 10),
                  AppText(
                    text: "Find trips and profiles",
                    size: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, right: 8, left: 8, bottom: 24),
                    child: Container(
                      width: 320,
                      child: SearchAnchor(builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      }, suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(10, (int index) {
                          final String item = 'Trip $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      }),
                    ),
                  ),
                  AppText(
                    text: "Most viwed profiles:",
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                TravelTile(
                  name: 'Barbara Miller',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-6.avif'),
                ),
                SizedBox(height: 12),
                TravelTile(
                  name: 'Thomas Anderson',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-1.avif'),
                ),
                SizedBox(height: 12),
                TravelTile(
                  name: 'Elizabeth Jones',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-2.avif'),
                ),
                SizedBox(height: 12),
                TravelTile(
                  name: 'Michael Williams',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-3.avif'),
                ),
                SizedBox(height: 12),
                TravelTile(
                  name: 'Susan Davis',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-4.avif'),
                ),
                SizedBox(height: 12),
                TravelTile(
                  name: 'Sarah Anderson',
                  description:
                      'I love immersing myself in new cultures, exploring historical.',
                  imageCard: AssetImage('assets/images/profile-5.avif'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
