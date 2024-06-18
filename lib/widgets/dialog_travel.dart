import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_out_flutter/widgets/text_form_field_travel.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    bool loading = false;
    final formKey = GlobalKey<FormState>();
    final placeController = TextEditingController();
    final dateController = TextEditingController();
    final descriptionController = TextEditingController();

    Future<void> createTravel() async {
    if (loading) return;
    setState(() => loading = true);

    final place = placeController.text.trim();
    final date = dateController.text.trim();
    final description = descriptionController.text.trim();
    final fireAuth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    final id = fireAuth.currentUser!.uid;

    ScaffoldMessenger.of(context).clearSnackBars();

    final data = {
      "place": place,
      "date": date,
      "description": description,
      "id": id,
    };

    final collection = firestore.collection("occurrences/$id/history");
    await collection.add(data);

    placeController.clear();
    dateController.clear();

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: AppText(
        text: 'Add your new travel here!',
        color: AppTravelColors.blueApp,
        size: 18,
      ),
      content:Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TextFormField(
          controller: placeController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Place:',
          ),
        ),
          TextFormField(
          controller: dateController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Date:',
            suffixIcon: GestureDetector(
              onTap: () {
                Future<DateTime?> selecioneUmaData = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  }
                );
                selecioneUmaData.then((data) {
                  if (data != null) {
                    // Faça algo com a data selecionada
                    String formattedDate = "${data.month.toString().padLeft(2, '0')}/${data.day.toString().padLeft(2, '0')}/${data.year}";
                    dateController.text = formattedDate;
                  }
                });
              },
              child: const Icon(Icons.calendar_today),
            ),
          ),
          readOnly: true,
        ),
        TextFormField(
          controller: descriptionController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Description:',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ],
      ),
    )
  ],
)
,
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
              onPressed: () {
                    if (formKey.currentState!.validate()) {
                      createTravel();
                      Navigator.of(context).pop();
                  };
              },
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
