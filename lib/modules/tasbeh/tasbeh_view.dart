import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/Application_Theme_Manager.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  double turns = 0.0;
  int count = 0;
  int index = 0;
  List<String> tasbehList = [
    'سبحان الله ',
    'الحمد لله ',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/head of seb7a.png',
                scale: 1.5,
              ),
              AnimatedRotation(
                duration: Duration(
                  seconds: 1,
                ),
                turns: turns,
                child: Image.asset(
                  'assets/images/body of seb7a.png',
                  scale: 2.5,
                ),
              ),
            ],
          ),
        ),
        Text(
          'عدد التسبيحات',
          style: theme.textTheme.bodyLarge,
        ),
        Container(
          margin: EdgeInsets.only(top: 30, bottom: 30),
          height: 80,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ApplicationThemeManager.primaryColor.withOpacity(0.6)),
          child: Center(
            child: Text(
              count.toString(),
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 35),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ApplicationThemeManager.primaryColor,
          ),
          onPressed: () {
            setState(() {
              count += 1;
              turns = turns + 1 / 33;
              if (count == 33) {
                if (index < 2) {
                  index += 1;
                  count = 0;
                } else {
                  index = 0;
                  count = 0;
                }
              }
            });
          },
          child: Text(
            tasbehList[index],
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
