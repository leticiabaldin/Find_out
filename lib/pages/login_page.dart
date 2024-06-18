import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors_travel.dart';
import '../widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Future<void> login() async {
    final fireAuth = FirebaseAuth.instance;
    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      final credentials = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      goToHome();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Verifique suas credenciais ou crie uma conta.',
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 3000),
        ),
      );
    }
  }

  void goToHome() {
    context.go('/home');
  }

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME TO TRAVEL APP',
                    style: TextStyle(
                      color: AppTravelColors.blueApp,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                    text: 'Enjoy the experience',
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
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: _isObscure,
                      textInputAction: TextInputAction.go,
                      cursorColor: AppTravelColors.blueApp,
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
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go('/createAccount'),
                          child: const Text(
                            'Click Here!',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppTravelColors.blueApp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 64),
                    SizedBox(
                      width: double.maxFinite,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTravelColors.blueApp,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text(
                          'LOG IN',
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
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 80,
              width: 200,
              child: Image.asset('assets/images/login_image.png'),
            )
          ],
        ),
      ),
    );
  }
}
