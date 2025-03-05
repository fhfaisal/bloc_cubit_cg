import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/utils/theme/cubit/theme_cubit.dart';
import '../../auth/login_page.dart';
class HomeDrawer extends StatelessWidget {
   HomeDrawer({
    super.key,
  });
  final storage = StorageService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// Drawer header
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text("Menu"),
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
          /// Theme Toggle using SwitchListTile
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final platformBrightness = MediaQuery.of(context).platformBrightness;
              final isDark = state.themeMode == ThemeMode.dark || (state.themeMode == ThemeMode.system && platformBrightness == Brightness.dark);
              return ListTile(
                leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                title: Text(isDark ? "Light Mode" : "Dark Mode"),
                trailing: Switch(
                  value: isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme(
                          brightness: value ? Brightness.dark : Brightness.light,
                        );
                  },
                ),
              );
            },
          ),

          /// Logout option
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              storage.clearAllData();
              Navigator.pop(context); // Close the drawer.
              context.replaceNamed(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}