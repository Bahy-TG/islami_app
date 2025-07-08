import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/providers/app_config_provider.dart';
import 'package:untitled/features/home/view/hadeth_tab/hadeth_details_screen.dart';
import 'package:untitled/features/home/view/quran_tab/sura_details_screen.dart';
import 'core/theme/app_theme_data.dart';
import 'features/home/view/home_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      theme: AppThemeData.lightMode,
      themeMode: provider.appTheme,
      darkTheme: AppThemeData.darkMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLang),
    );
  }
}
