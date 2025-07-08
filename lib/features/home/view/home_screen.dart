import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/providers/app_config_provider.dart';
import 'package:untitled/features/home/view/hadeth_tab/hadeth_tab.dart';
import 'package:untitled/features/home/view/quran_tab/quran_tab.dart';
import 'package:untitled/features/home/view/setting_tab/setting_tab.dart';
import '../../../core/constants/constants.dart';

import '../../../l10n/app_localizations.dart';
import 'radio_tab/radio_tab.dart';
import 'sebha_tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.light?
          'assets/images/default_bg.png':
          'assets/images/dark_bg.png',
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
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              items: [
                buildBottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                ),
                buildBottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.hadeth,
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                ),
                buildBottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha,
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                ),
                buildBottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                ),
                buildBottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.setting,
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String label,
    required Widget icon,
  }) {
    return BottomNavigationBarItem(label: label, icon: icon);
  }

  List<Widget> tabs = const [
    QuranTab(),
    HadethTap(),
    SebhaTab(),
    RadioTab(),
    SettingTab(),
  ];
}
