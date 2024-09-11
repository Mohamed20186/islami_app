import 'package:flutter/material.dart';
import 'package:islami_app/LayOut/LayOut_view.dart';
import 'package:islami_app/core/Application_Theme_Manager.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/modules/quran/quran_details.dart';
import 'package:islami_app/modules/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'modules/hadeth/hadeth_details_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      locale: Locale(provider.currentLanguageCode),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: provider.currentThemeMode,
      darkTheme: ApplicationThemeManager.darkThemeData,
      title: 'Flutter Demo',
      theme: ApplicationThemeManager.lightThemeData,
      initialRoute: "/",
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        layOut_View.routeName: (context) => layOut_View(),
        QuranDetails.routeName: (context) => QuranDetails(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
    );
  }
}
