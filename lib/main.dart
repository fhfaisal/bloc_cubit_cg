import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/injection_container.dart';
import 'core/routes/app_router.dart';
import 'core/utils/theme/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
        ),
      ],
      child: MaterialApp.router(
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('bn'),
        ],
        localizationsDelegates: [
          /// [AppLocalization] present in -------- .dart_tool/flutter_gen/gen_l10n ------- if it is missing run this in your terminal[flutter gen-l10n]
          /// then IMPORT [import 'package:flutter_gen/gen_l10n/app_localizations.dart';]
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode:ThemeMode.system,
        routerConfig: router, // Use GoRouter for navigation
      ),
    );
  }
}
