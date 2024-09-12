import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/Application_Theme_Manager.dart';
import 'package:islami_app/core/manager/settings_provider.dart';
import 'package:islami_app/modules/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';

class HadethDetailsView extends StatelessWidget {
  const HadethDetailsView({super.key});
  static const String routeName = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadethData;
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.getHomeBackGround(),
          ),
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
              Text(
                data.title,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: provider.isDark()
                      ? ApplicationThemeManager.primaryDarkColor
                      : Color(0xff242424),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Text(
                      data.body,
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
}
