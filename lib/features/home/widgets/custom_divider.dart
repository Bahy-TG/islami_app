import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/providers/app_config_provider.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;

  const CustomDivider({super.key, required this.thickness});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Divider(
      color: provider.appTheme == ThemeMode.dark
          ? AppColors.yellowColor
          : AppColors.primaryLightColor,
      thickness: thickness,
    );
  }
}
