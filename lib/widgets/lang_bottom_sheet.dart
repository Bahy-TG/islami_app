import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/item_selected_unselected.dart';
import '../core/constants/app_colors.dart';
import '../core/providers/app_config_provider.dart';
import '../l10n/app_localizations.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.changeLang('en');
            },
            child: provider.appLang == 'en'
                ? ItemSelectedUnselected().getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.en,
                  )
                : ItemSelectedUnselected().getUnselectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.en,
                  ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.changeLang('ar');
            },
            child: provider.appLang == 'ar'
                ? ItemSelectedUnselected().getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.ar,
                  )
                : ItemSelectedUnselected().getUnselectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.ar,
                  ),
          ),
        ],
      ),
    );
  }
}
