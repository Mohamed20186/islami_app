import 'package:flutter/material.dart';
import 'package:islami_app/modules/quran/quran_view.dart';

class SuraTitleWidget extends StatelessWidget {
  const SuraTitleWidget({
    super.key,
    required this.suraData,
  });

  final SuraData suraData;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            suraData.suraNumber,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 35,
          child: VerticalDivider(),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            suraData.suraName,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
