import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/home/widgets/item_hadeth_list.dart';
import 'package:untitled/models/hadeth_data_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/Item_sura_list.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethDataModel> hadethListView = [];

  @override
  Widget build(BuildContext context) {
    loadHadeth();
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png', width: 250, height: 250),
        CustomDivider(thickness: 3),
        Text(AppLocalizations.of(context)!.hadeth_name),
        CustomDivider(thickness: 3),
        Expanded(
          child: hadethListView.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return CustomDivider(thickness: 1);
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethList(hadeth: hadethListView[index]);
                  },
                  itemCount: hadethListView.length,
                ),
        ),
      ],
    );
  }

  void loadHadeth() async {
    String hadethList = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> list = hadethList.split('#\r\n');
    for (int i = 0; i < list.length; i++) {
      List<String> hadethLines = list[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethDataModel hadeth = HadethDataModel(
        title: title,
        content: hadethLines,
      );
      hadethListView.add(hadeth);
      setState(() {});
    }
  }
}
