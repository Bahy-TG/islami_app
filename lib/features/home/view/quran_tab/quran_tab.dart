import 'package:flutter/material.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/l10n/app_localizations.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/Item_sura_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          width: 250,
          height: 250,
        ),
        CustomDivider(thickness: 3,),
        Text(AppLocalizations.of(context)!.sura_name),
        CustomDivider(thickness: 3,),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return CustomDivider(thickness: 1,);
            },
            itemBuilder: (context, index) {
              return ItemSureList(title: AppConstants.suraNameList[index],index: index,);
            },
            itemCount: AppConstants.suraNameList.length,
          ),
        ),
      ],
    );
  }
}

