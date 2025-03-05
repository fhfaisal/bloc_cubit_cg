import 'package:cubit_bloc/core/routes/app_routes.dart';
import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/core/utils/constants/app_text.dart';
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
            final storage = StorageService();
            storage.setFirstTime(false);
            context.go(AppRoutes.login); // Navigate to login
          },
          child: Text('Close'),
        ),
      ),
    );
  }
}
