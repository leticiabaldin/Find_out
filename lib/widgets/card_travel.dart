import 'package:flutter/material.dart';

import '../colors/colors_travel.dart';
import 'app_text.dart';

class CardTravel extends StatelessWidget {
  final String titleCard;
  final AssetImage imageCard;
  final String description;

  const CardTravel({
    Key? key,
    required this.titleCard,
    required this.imageCard,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 32),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
/*           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 28,
                  color: AppTravelColors.blueApp,
                ),
              ),
            ],
          ), */
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 360,
            child: Image(
              image: imageCard,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            alignment: Alignment.bottomRight,
            child: Text(
              titleCard,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 0,
              bottom: 10,
              right: 6,
              left: 10,
            ),
            child: AppText(
                text: description),
          ),
        ],
      ),
    );
  }
}
