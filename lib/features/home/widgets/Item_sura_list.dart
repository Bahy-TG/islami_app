import 'package:flutter/material.dart';
import 'package:untitled/features/home/view/quran_tab/sura_details_screen.dart';
import 'package:untitled/models/sura_data_model.dart';

class ItemSureList extends StatelessWidget {
  final String title;
  final int index;

  const ItemSureList({super.key, required this.title,required this.index });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDataModel(
            name: title,
            index: index,
          ),
        );
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
