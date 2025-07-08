import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/item_selected_unselected.dart';
import '../core/constants/app_colors.dart';
import '../core/providers/app_config_provider.dart';
import '../l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? ItemSelectedUnselected().getSelectedItemWidget(
              context,
              AppLocalizations.of(context)!.light,
            )
                : ItemSelectedUnselected().getUnselectedItemWidget(
              context,
              AppLocalizations.of(context)!.light,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? ItemSelectedUnselected().getSelectedItemWidget(
              context,
              AppLocalizations.of(context)!.dark,
            )
                : ItemSelectedUnselected().getUnselectedItemWidget(
              context,
              AppLocalizations.of(context)!.dark,
            ),
          ),
        ],
      ),
    );
  }
}
