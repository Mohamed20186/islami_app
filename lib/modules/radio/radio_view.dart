import 'package:flutter/material.dart';
import 'package:islami_app/core/manager/radio_provider.dart';
import 'package:provider/provider.dart';

import '../../core/theme/Application_Theme_Manager.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
              provider.currentRadio.name,
              style: theme.textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    provider.prev();
                  },
                  icon: const Icon(
                    Icons.skip_previous_rounded,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.play();
                  },
                  icon: Icon(
                    provider.isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    size: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.next();
                  },
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    size: 40,
                  ),
                ),
              ],
            )
          ],
        );
      },
    ));
  }
}
