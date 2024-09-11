import 'package:flutter/material.dart';
import 'package:islami_app/modules/hadeth/hadeth_view.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:islami_app/modules/radio/radio_view.dart';
import 'package:islami_app/modules/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/tasbeh/tasbeh_view.dart';
import 'package:provider/provider.dart';

import '../core/settings_provider.dart';

class layOut_View extends StatefulWidget {
  static const String routeName = "LayOut";

  layOut_View({Key? key}) : super(key: key);

  @override
  State<layOut_View> createState() => _layOut_ViewState();
}

class _layOut_ViewState extends State<layOut_View> {
  int selectedIndex = 0;
  List<Widget> screenList = [
    QuranView(),
    HadethView(),
    const TasbehView(),
    const RadioView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(provider.getHomeBackGround()),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(
              child: Text(lang.app_title),
            ),
          ),
          body: screenList[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/quran.png"),
                ),
                label: lang.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/hadeeth.png"),
                ),
                label: lang.hadeth,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/sebha.png"),
                ),
                label: lang.tasbeh,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/radio.png"),
                ),
                label: lang.radio,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: lang.setting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
