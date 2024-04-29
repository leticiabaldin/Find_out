import 'package:find_out_flutter/colors/colors_travel.dart';
import 'package:flutter/material.dart';

class TextFormFieldTravel extends StatelessWidget {
  final String text;

  const TextFormFieldTravel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      cursorColor: AppTravelColors.blueApp,
      decoration: InputDecoration(
        fillColor: AppTravelColors.greyApp,
        //filled: true,
        labelText: text,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: AppTravelColors.blueApp,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppTravelColors.blueApp,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppTravelColors.blueApp,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppTravelColors.blueApp,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppTravelColors.blueApp,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
