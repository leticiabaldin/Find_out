import 'package:find_out_flutter/widgets/text_form_field_travel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors_travel.dart';
import 'app_text.dart';

class DialogTravel extends StatefulWidget {
  const DialogTravel({super.key});

  @override
  State<DialogTravel> createState() => _DialogTravelState();
}

class _DialogTravelState extends State<DialogTravel> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: AppText(
        text: 'Add your new travel here!',
        color: AppTravelColors.blueApp,
        size: 18,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormFieldTravel(text: 'Place:'),
          SizedBox(
            height: 10,
          ),
          TextFormFieldTravel(text: 'Date:'),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppTravelColors.blueApp,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 38,
                  vertical: 12,
                ),
                backgroundColor: AppTravelColors.blueApp,
              ),
              child: const Text('Add', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),

      ],
    );
  }
}
