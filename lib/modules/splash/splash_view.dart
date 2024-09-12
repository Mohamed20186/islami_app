import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/LayOut/LayOut_view.dart';
import 'package:islami_app/core/manager/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/";
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, layOut_View.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return provider.isDark()
        ? Image.asset(
            "assets/images/dark_splash.png",
            fit: BoxFit.fill,
          )
        : Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.fill,
          );
  }
}
