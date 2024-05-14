import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:find_out_flutter/widgets/bottom_navigation_bar_travel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/dialog_travel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const DialogTravel();
    },
  );
}

List images = [
  "assets/images/trip1.jpg",
  "assets/images/trip2.jpg",
  "assets/images/trip3.jpg",
  "assets/images/trip4.jpg",
];
List cards = [
  "assets/images/trip1.jpg",
  "assets/images/trip2.jpg",
  "assets/images/trip3.jpg",
  "assets/images/trip4.jpg",
];

final List<Widget> imageSliders = images
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: [
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: const Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<Widget> cardInfo = cards
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(5),
        child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 0.3,
              color: AppTravelColors.greyApp,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  item,
                  height: 100,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/profile-image.png'),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Emma Watson',
                        style: TextStyle(
                          color: AppTravelColors.blueApp,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 260,
                  height: 20,
                  child: AppText(
                    text: 'Lorem Ipsum Lorem',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing:
            -34, // Adicione esta linha para alinhar o texto completamente à esquerda
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Hi, Letícia Baldin!',
            style: TextStyle(
              color: AppTravelColors.blueApp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(
              Icons.exit_to_app_outlined,
              size: 32,
              color: AppTravelColors.blueApp,
            ),
          ),
          IconButton(
            onPressed: () => context.go('/team'),
            icon: const Icon(
              Icons.info_outline,
              size: 32,
              color: AppTravelColors.blueApp,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLargeText(text: "Welcome Page"),
                    AppText(
                      text: "Travel App",
                      size: 28,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 360,
                      child: AppText(
                        text:
                            "Mountain hikes give you an incredible sense of freedom along with endurance test.",
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () => _dialogBuilder(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64,
                              vertical: 12,
                            ),
                            backgroundColor: AppTravelColors.blueApp,
                          ),
                          child: const Text(
                            'Add New Travel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Explore other places',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTravelColors.blueApp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1.75,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          clipBehavior: Clip.antiAliasWithSaveLayer),
                      items: imageSliders,
                    ),
                    AppText(
                      text: "Travel App",
                      size: 28,
                      color: AppTravelColors.blueApp,
                    ),
                    SizedBox(
                      width: 360,
                      child: AppText(
                        text:
                            "Mountain hikes give you an incredible sense of freedom along with endurance test.",
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "See the people's experience",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTravelColors.blueApp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1.75,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          clipBehavior: Clip.antiAliasWithSaveLayer),
                      items: cardInfo,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
