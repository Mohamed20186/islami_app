import 'package:flutter/material.dart';
import 'package:islami_app/core/manager/radio_provider.dart';
import 'package:provider/provider.dart';

import '../../core/theme/Application_Theme_Manager.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        body: ChangeNotifierProvider<RadioProvider>(
      create: (context) => RadioProvider()..getRadios(),
      builder: (context, child) {
        var provider = Provider.of<RadioProvider>(context);
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ApplicationThemeManager.primaryDarkColor,
            ),
          );
        }
        if (provider.isError) {
          return Center(
            child: Text(
              'Error',
              style: theme.textTheme.bodyMedium,
            ),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/radio.png'),
            Text(
              'إذاعة القرآن الكريم',
              style: theme.textTheme.bodyLarge,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.skip_previous_rounded,
                  size: 40,
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  size: 70,
                ),
                Icon(
                  Icons.skip_next_rounded,
                  size: 40,
                ),
              ],
            )
          ],
        );
      },
    ));
  }
}
