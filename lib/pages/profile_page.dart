import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors_travel.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/bottom_navigation_bar_travel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  getName() {
    final fireAuth = FirebaseAuth.instance;
    final user = fireAuth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //color: AppTravelColors.pink,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Container(
              margin: const EdgeInsets.only(
                top: 80,
                left: 12,
                right: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppLargeText(text: "Profile"),
                      const SizedBox(width: 50),
                    ],
                  ),
                  AppText(
                    text: "See your informations",
                    size: 24,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 32, // Image radius
                        foregroundImage:
                            AssetImage("assets/images/profile-image.png"),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Letícia Baldin',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      // margin: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 320,
                        child: AppText(
                          text:
                              "I'm excited to share my adventures, travel tips, and recommendations with all of you. I also look forward to learning from your experiences and finding inspiration for my future travels. Let's embark on this journey together and make unforgettable memories around the world!",
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppText(
                    text: "My Trips",
                    size: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppText(
                    text: "Collect Memories",
                    size: 24,
                  ),
                  const SizedBox(
                    height: 16,
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
                      context.go('/listCountries');
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
          ),
        ],
      ),
    );
  }
}
