import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/home/widgets/custom_divider.dart';
import 'package:untitled/features/home/widgets/item_hadeth_details.dart';
import 'package:untitled/features/home/widgets/item_sura_verses.dart';
import 'package:untitled/models/hadeth_data_model.dart';
import 'package:untitled/models/sura_data_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadethDataModel;
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
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.whiteColor.withAlpha(200)
                    : AppColors.blueColor.withAlpha(200),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      color: provider.appTheme == ThemeMode.light
                          ? AppColors.whiteColor.withAlpha(200)
                          : AppColors.yellowColor.withAlpha(200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                      bottom: 16,
                    ),
                    child: CustomDivider(thickness: 2),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ItemHadethDetails(content: data.content[index]);
                      },
                      itemCount: data.content.length,
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
}
