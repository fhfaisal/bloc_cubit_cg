import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Onboarding")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final storage = GetStorage();
            storage.write('isFirstTime', false);
            context.go('/login'); // Navigate to login
          },
          child: const Text("Get Started"),
        ),
      ),
    );
  }
}
