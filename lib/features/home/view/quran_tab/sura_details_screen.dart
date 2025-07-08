import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/providers/app_config_provider.dart';
import 'package:untitled/features/home/widgets/custom_divider.dart';
import 'package:untitled/features/home/widgets/item_sura_verses.dart';
import 'package:untitled/models/sura_data_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/constants.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraDataModel;
    if (verses.isEmpty) {
      loadVerses(index: data.index);
    }
    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.light
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              AppConstants.getAppBarTitle(context),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(

                color:
    provider.appTheme == ThemeMode.light?
                AppColors.whiteColor.withAlpha(200):
                AppColors.blueColor.withAlpha(200),
                borderRadius: BorderRadius.circular(30),
              ),
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryLightColor,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(data.name),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                            bottom: 16,
                          ),
                          child: CustomDivider(thickness: 2),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return CustomDivider(thickness: 1);
                            },
                            itemBuilder: (context, index) {
                              return ItemSuraVerses(content: verses[index]);
                            },
                            itemCount: verses.length,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void loadVerses({required int index}) async {
    String versesList = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
      cache: true,
    );
    List<String> list = versesList.split('\n');
    setState(() {
      verses = list;
    });
  }
}
