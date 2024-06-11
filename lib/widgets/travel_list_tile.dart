import 'package:flutter/material.dart';

class TravelTile extends StatelessWidget {
  final String name;
  final AssetImage imageCard;
  final String description;

  const TravelTile(
      {super.key,
      required this.name,
      required this.description,
      required this.imageCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          foregroundImage: imageCard,
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
