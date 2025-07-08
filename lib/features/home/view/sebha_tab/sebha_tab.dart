import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/constants/app_colors.dart';

import '../../../../core/providers/app_config_provider.dart';
import '../../../../l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;
  int count = 0;
  double rotation = 0.00;
  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .05,
          ),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * .11,
                  ),
                  child: Image.asset(
                      provider.appTheme == ThemeMode.light?
                      'assets/images/head_sebha_logo.png':
                      'assets/images/head_sebha_dark.png'

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .083,
                  ),
                  child: AnimatedRotation(
                    child: Image.asset(
                        provider.appTheme == ThemeMode.light?
                        'assets/images/body_sebha_logo.png':
                        'assets/images/body_sebha_dark.png',
                    ),
                    duration: Duration(microseconds: 200),
                    turns: rotation,

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        Text( AppLocalizations.of(context)!.counter, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 30),
        Container(
          width: 60,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color:
            provider.appTheme == ThemeMode.light?
                        AppColors.primaryLightColor.withValues(alpha: .57):
                        AppColors.blueColor.withValues(alpha: .57),
          ),
          child: Center(child: Text(count.toString())),
        ),
        SizedBox(height: 30),
        TextButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(160, 40)),
            backgroundColor: WidgetStatePropertyAll(
              provider.appTheme == ThemeMode.light?
              AppColors.primaryLightColor:
              AppColors.yellowColor,
            ),
          ),
          onPressed: () {
            if (count > 32) {
              count = 0;
              index++;
              if (index == azkar.length) {
                index = 0;
              }
            }
            count++;
            rotation += 0.03;
            setState(() {});
          },
          child: Text(
            azkar[index],
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color:
            provider.appTheme == ThemeMode.light?
            AppColors.whiteColor:
            AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
