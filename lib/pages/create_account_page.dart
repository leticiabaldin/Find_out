import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors_travel.dart';
import '../widgets/app_text.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppTravelColors.blueApp,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.go('/'),
                      icon: const Icon(
                        Icons.exit_to_app_outlined,
                        size: 32,
                        color: AppTravelColors.blueApp,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Fill with your information',
                      size: 18,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        cursorColor: AppTravelColors.blueApp,
                        decoration: InputDecoration(
                          fillColor: AppTravelColors.greyApp,
                          //filled: true,
                          labelText: 'Name',
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
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        cursorColor: AppTravelColors.blueApp,
                        decoration: InputDecoration(
                          fillColor: AppTravelColors.greyApp,
                          //filled: true,
                          labelText: 'Email',
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
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        cursorColor: AppTravelColors.blueApp,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: AppTravelColors.blueApp,
                            ),
                          ),
                          fillColor: AppTravelColors.greyApp,
                          //filled: true,
                          labelText: 'Password',
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
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        cursorColor: AppTravelColors.blueApp,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: AppTravelColors.blueApp,
                            ),
                          ),
                          fillColor: AppTravelColors.greyApp,
                          //filled: true,
                          labelText: 'Confirm Password',
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
                      ),
                      const SizedBox(height: 64),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () => context.go('/home'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppTravelColors.blueApp,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text(
                            'CONFIRM',
                            style: TextStyle(
                              fontSize: 16,
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
        ),
      ),
    );
  }
}
