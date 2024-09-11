import 'package:flutter/material.dart';
import 'package:islami_app/modules/quran/quran_details.dart';
import 'package:islami_app/modules/quran/widgets/sura_title_widget.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});
  final List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          'assets/icons/quran_header_icn.png',
          scale: 3,
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "رقم السورة",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 35,
              child: VerticalDivider(),
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "اسم السورة",
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: suraNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      QuranDetails.routeName,
                      arguments: SuraData(
                          suraName: suraNames[index],
                          suraNumber: (index + 1).toString()),
                    );
                  },
                  child: SuraTitleWidget(
                    suraData: SuraData(
                        suraName: suraNames[index],
                        suraNumber: (index + 1).toString()),
                  ),
                );
              }),
        )
      ],
    ));
  }
}

class SuraData {
  final String suraName;
  final String suraNumber;

  SuraData({required this.suraName, required this.suraNumber});
}
