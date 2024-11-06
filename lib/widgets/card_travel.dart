import 'package:flutter/material.dart';

import '../colors/colors_travel.dart';
import 'app_text.dart';

class CardTravel extends StatelessWidget {
  final String titleCard;
 // final String? imageCard; // Agora aceita uma URL opcional
  final String description;

  const CardTravel({
    Key? key,
    required this.titleCard,
    //this.imageCard, // URL opcional da imagem
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
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 360,
            child: Image.network(
              "assets/images/trip1.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "assets/images/trip1.jpg",
                fit: BoxFit.cover,
              ),
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
            child: AppText(text: description),
          ),
        ],
      ),
    );
  }
}
