import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modules/hadeth/hadeth_details_view.dart';

class HadethView extends StatefulWidget {
  HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethData> dataList = [];
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (dataList.isEmpty) loadHadethData();
    return Column(
      children: [
        Image.asset(
          'assets/icons/hadith_header.png',
          scale: 3,
        ),
        Divider(),
        Text(
          'الاحاديث',
          style: theme.textTheme.bodyLarge,
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetailsView.routeName,
                      arguments: dataList[index],
                    );
                  },
                  child: Text(
                    dataList[index].title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future loadHadethData() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethData = content.split('#');
    for (int i = 0; i < allHadethData.length; i++) {
      String singleHadeth = allHadethData[i].trim();
      int titleLenght = singleHadeth.indexOf('\n');
      String title = singleHadeth.substring(0, titleLenght);
      String hadethBody = singleHadeth.substring(titleLenght + 1);
      dataList.add(HadethData(title: title, body: hadethBody));
      setState(() {});
    }
  }
}

class HadethData {
  final String title;
  final String body;

  HadethData({required this.title, required this.body});
}
