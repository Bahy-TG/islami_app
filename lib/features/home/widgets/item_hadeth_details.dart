import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/providers/app_config_provider.dart';

import '../../../core/constants/app_colors.dart';

class ItemHadethDetails extends StatelessWidget {
  final String content;

  const ItemHadethDetails({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: provider.appTheme == ThemeMode.light
            ? AppColors.whiteColor.withAlpha(200)
            : AppColors.yellowColor.withAlpha(200),
      ),
    );
  }
}
