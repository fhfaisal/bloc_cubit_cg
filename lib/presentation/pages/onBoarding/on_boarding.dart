import 'package:cubit_bloc/core/routes/app_routes.dart';
import 'package:cubit_bloc/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/language/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      //appBar: AppBar(title: const Text("Onboarding")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final storage = GetStorage();
            storage.write(AppConstants.isFirstTime, false);
            context.go(AppRoutes.login); // Navigate to login
          },
          child: Text(loc.onboardingMessage),
        ),
      ),
    );
  }
}
