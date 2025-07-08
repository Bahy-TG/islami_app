import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../l10n/app_localizations.dart';

class ItemSelectedUnselected {
  //Selected
  Widget getSelectedItemWidget(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.primaryLightColor),
        ),
        Icon(Icons.check, color: AppColors.primaryLightColor, size: 32),
      ],
    );
  }

  //Unselected
  Widget getUnselectedItemWidget(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text, style: Theme.of(context).textTheme.bodySmall)],
    );
  }
}
