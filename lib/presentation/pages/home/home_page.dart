import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/core/utils/constants/app_text.dart';
import 'package:cubit_bloc/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cubit_bloc/core/routes/app_routes.dart';

import '../../../main.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage =StorageService();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              storage.clearAllData();
              context.replaceNamed(AppRoutes.login);
            },
          ),
          ///Its a language switcher
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     Locale newLocale;
          //     if (value == 'en') {
          //       newLocale = const Locale('en');
          //     } else {
          //       newLocale = const Locale('bn');
          //     }
          //     // You might use a callback or state management to notify the main app
          //     // For this example, assume you have a method to update the locale.
          //     // One approach is to use an InheritedWidget or a state management solution.
          //     MyApp.of(context)?.setLocale(newLocale);
          //   },
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     const PopupMenuItem<String>(
          //       value: 'en',
          //       child: Text("English"),
          //     ),
          //     const PopupMenuItem<String>(
          //       value: 'bn',
          //       child: Text("বাংলা"),
          //     ),
          //   ],
          // ),
        ],
      ),
      body: Center(child: Text(storage.getUserData().toString())),
    );
  }
}
