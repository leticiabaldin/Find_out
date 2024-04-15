import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarTravel(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
                children: [
                  Row(
                    children: [
                      AppLargeText(
                        text: 'Letícia Baldin',
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 50),
                      const CircleAvatar(
                        radius: 45, // Image radius
                        foregroundImage:
                            AssetImage("assets/images/profile-image.png"),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      // margin: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Eu sou uma pesssoa que ama viajar para Montanhas e meu sonho é conhecer Mykhonos na Grécia. Adoro compartilhar minhas experiências nas redes socais!",
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    width: 272,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 72,
                          vertical: 12,
                        ),
                        backgroundColor: AppTravelColors.blueApp,
                      ),
                      child: const Text(
                        'MINHAS VIAGENS',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
