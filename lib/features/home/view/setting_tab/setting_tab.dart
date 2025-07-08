import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/core/providers/app_config_provider.dart';
import 'package:untitled/widgets/lang_bottom_sheet.dart';
import 'package:untitled/widgets/theme_bottom_sheet.dart';

import '../../../../l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.lang),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              showLangBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(13),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryLightColor.withOpacity(.7)
                    : AppColors.blueColor.withOpacity(.7),

                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLang == 'en'
                        ? AppLocalizations.of(context)!.en
                        : AppLocalizations.of(context)!.ar,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: provider.appTheme == ThemeMode.light
                          ? AppColors.whiteColor
                          : AppColors.yellowColor,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, size: 35),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(AppLocalizations.of(context)!.mode),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(13),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryLightColor.withOpacity(.7)
                    : AppColors.blueColor.withOpacity(.7),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.dark
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: provider.appTheme == ThemeMode.light
                          ? AppColors.whiteColor
                          : AppColors.yellowColor,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, size: 35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLangBottomSheet() {

    showModalBottomSheet(

      context: context,
      builder: (context) => LangBottomSheet(),
    );
  }

  void showThemeBottomSheet() {

    showModalBottomSheet(
            context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
