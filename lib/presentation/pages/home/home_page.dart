import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              GetStorage().write('isLoggedIn', false);
              context.replaceNamed(AppRoutes.login); // Clear stack after logout
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to Home Page"),
      ),
    );
  }
}
