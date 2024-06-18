import 'package:firebase_auth/firebase_auth.dart';
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
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  bool _isObscure = true;

  Future<void> createAccount() async {
    if (loading) return;

    setState(() => loading = true);

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    final fireAuth = FirebaseAuth.instance;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final credentials = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credentials.user!.updateDisplayName(name);

      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Seja Bem vindo(a), $name!'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      goToFlow();
    } catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Não foi possível criar a sua conta. Tente novamente.'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 2500),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => loading = false);
  }

  void goToFlow() {
    context.go('/home');
  }

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              Form(
                key: formKey,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 64, horizontal: 24),
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: nameController,
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
                          controller: emailController,
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
                          controller: passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _isObscure
                                  ? const Icon(Icons.remove_red_eye_rounded)
                                  : const Icon(Icons.remove_red_eye_outlined),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
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
                        const SizedBox(height: 64),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              createAccount();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTravelColors.blueApp,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: const Text(
                              'CONFIRM',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
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
