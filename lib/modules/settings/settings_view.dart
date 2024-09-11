import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    final List<String> languagesList = ['Arabic', 'English'];
    final List<String> themeList = ['dark', 'light'];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "language",
            style: theme.textTheme.bodyLarge,
          ),
          CustomDropdown<String>(
            items: languagesList,
            initialItem: provider.currentLanguageCode == 'eg'
                ? languagesList[0]
                : languagesList[1],
            onChanged: (value) {
              if (value == 'English') {
                provider.changeLanguageCode(
                  newLanguageCode: 'en',
                );
              }
              if (value == 'Arabic') {
                provider.changeLanguageCode(
                  newLanguageCode: 'ar',
                );
              }
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? Color(0xff141A2E) : Colors.white,
              expandedFillColor:
                  provider.isDark() ? Color(0xff141A2E) : Colors.white,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Theme",
            style: theme.textTheme.bodyLarge,
          ),
          CustomDropdown<String>(
            items: themeList,
            initialItem: provider.currentThemeMode == ThemeMode.dark
                ? themeList[0]
                : themeList[1],
            onChanged: (value) {
              if (value == 'dark') {
                provider.changeThemeMode(newThemeMode: ThemeMode.dark);
              }
              if (value == 'light') {
                provider.changeThemeMode(newThemeMode: ThemeMode.light);
              }
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? Color(0xff141A2E) : Colors.white,
              expandedFillColor:
                  provider.isDark() ? Color(0xff141A2E) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
