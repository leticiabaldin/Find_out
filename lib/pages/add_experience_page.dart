import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors_travel.dart';
import '../widgets/bottom_navigation_bar_travel.dart';
import '../widgets/text_form_field_travel.dart';

class AddExperiencePage extends StatefulWidget {
  final String countryName; // País passado na navegação

  const AddExperiencePage({super.key, required this.countryName});

  @override
  State<AddExperiencePage> createState() => _AddExperiencePageState();
}

class _AddExperiencePageState extends State<AddExperiencePage> {
  bool loading = false;
  final dateController = TextEditingController();
  final placeController = TextEditingController();
  final descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Inicializa o campo place com o nome do país recebido
    placeController.text = widget.countryName;
  }

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
      "place": widget.countryName,
      "date": date,
      "description": description,
      "id": id,
    };

    final collection = firestore.collection("occurrences/$id/history");
    await collection.add(data);

    placeController.clear();
    dateController.clear();
    descriptionController.clear();

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBarTravel(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 30,
          right: 30,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/share'),
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      const SizedBox(width: 40),
                      const Text(
                        'New Experience',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTravelColors.greyApp,
                      elevation: 1,
                      fixedSize: const Size(128, 128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide.none,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 62,
                      weight: 3,
                      color: AppTravelColors.blueApp,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              TextFormFieldTravel(text: 'Title'),
              const SizedBox(height: 10),
              // Campo de data
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
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: AppTravelColors.blueApp,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                          });
                      selecioneUmaData.then((data) {
                        if (data != null) {
                          String formattedDate =
                              "${data.month.toString().padLeft(2, '0')}/${data.day.toString().padLeft(2, '0')}/${data.year}";
                          dateController.text = formattedDate;
                        }
                      });
                    },
                    child: const Icon(Icons.calendar_today),
                  ),
                ),
                readOnly: true,
              ),
              const SizedBox(height: 10),
              // Campo de descrição
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  fillColor: AppTravelColors.greyApp,
                  labelText: 'Description',
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
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    createTravel();
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Publish',
                      style: TextStyle(
                          color: AppTravelColors.blueApp, fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: AppTravelColors.blueApp,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
