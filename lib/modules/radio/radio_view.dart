import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        body: Column(
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
    ));
  }
}
