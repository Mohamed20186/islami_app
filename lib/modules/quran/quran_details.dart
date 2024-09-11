import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/Application_Theme_Manager.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatefulWidget {
  QuranDetails({super.key});
  static const String routeName = 'quranDetails';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    if (content.isEmpty) loadData(suraNumber: data.suraNumber);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getHomeBackGround()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('اسلامي'),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 30, top: 50),
          height: 652,
          width: 354,
          padding: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? Color(0xff141A2E).withOpacity(0.8)
                : Color(0xffF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.suraName,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: provider.isDark()
                          ? ApplicationThemeManager.primaryDarkColor
                          : Color(0xff242424),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.play_circle_fill_rounded,
                    size: 30,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: splitedContent.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "(${index + 1})${splitedContent[index]}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: provider.isDark()
                            ? ApplicationThemeManager.primaryDarkColor
                            : Color(0xff242424),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String content = '';
  List<String> splitedContent = [];
  Future loadData({required String suraNumber}) async {
    content = await rootBundle.loadString("assets/files/$suraNumber.txt");
    splitedContent = content.split('\n');
    setState(() {});
  }
}
