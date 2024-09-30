import 'package:flutter/material.dart';

import '../colors/colors_travel.dart';
import 'app_text.dart';

class CardTravel extends StatelessWidget {
  final String titleCard;
  final AssetImage imageCard;


  const CardTravel({
    Key? key,
    required this.titleCard,
    required this.imageCard,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 32,right: 6,left:6),
      elevation: 8,
      color: Colors.white,
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
            height: 350,
            width: 265,
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
        ],
      ),
    );
  }
}
