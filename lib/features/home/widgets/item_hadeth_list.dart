import 'package:flutter/material.dart';
import 'package:untitled/features/home/view/hadeth_tab/hadeth_details_screen.dart';
import 'package:untitled/features/home/view/quran_tab/sura_details_screen.dart';
import 'package:untitled/models/hadeth_data_model.dart';
import 'package:untitled/models/sura_data_model.dart';

class ItemHadethList extends StatelessWidget {
  final HadethDataModel hadeth;

  const ItemHadethList({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,HadethDetailsScreen.routeName,arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
