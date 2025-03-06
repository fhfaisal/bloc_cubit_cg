import 'package:cubit_bloc/core/utils/theme/cubit/theme_cubit.dart';
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/presentation/cubits/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';
import 'core/routes/app_router.dart';
import 'core/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Updated function name for DI setup

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

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
          BlocProvider<ThemeCubit>(create: (context) => injector<ThemeCubit>()),
          BlocProvider<AuthCubit>(create: (context) => injector<AuthCubit>()),
          BlocProvider<SearchCubit>(create: (context) => injector<SearchCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, themeState) {
          return MaterialApp.router(
            locale: _locale,
            supportedLocales: const [
              Locale('en'),
              Locale('bn'),
            ],
            // localizationsDelegates: [
            //   /// Run `flutter gen-l10n` if this is missing
            //   /// Then import: `import 'package:flutter_gen/gen_l10n/app_localizations.dart';`
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            routerConfig: router, // Use GoRouter for navigation
          );
        }));
  }
}
