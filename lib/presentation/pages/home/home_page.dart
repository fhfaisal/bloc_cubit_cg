import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cubit_bloc/core/routes/app_routes.dart';

import '../../../main.dart';
import '../../../utils/language/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.homeWelcome),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              GetStorage().write('isLoggedIn', false);
              context.replaceNamed(AppRoutes.login);
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              Locale newLocale;
              if (value == 'en') {
                newLocale = const Locale('en');
              } else {
                newLocale = const Locale('bn');
              }
              // You might use a callback or state management to notify the main app
              // For this example, assume you have a method to update the locale.
              // One approach is to use an InheritedWidget or a state management solution.
              MyApp.of(context)?.setLocale(newLocale);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text("English"),
              ),
              const PopupMenuItem<String>(
                value: 'bn',
                child: Text("বাংলা"),
              ),
            ],
          ),
        ],
      ),
      body: Center(child: Text(loc.homeWelcome)),
    );
  }
}
