import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/models/radio_model.dart';

import '../../../core/providers/app_config_provider.dart';

class RadioItems extends StatelessWidget {
  const RadioItems({super.key, required this.radio, required this.player});

  final RadioModel radio;

 final AudioPlayer player ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          radio.name ?? 'اذاعة القران الكريم من القاهرة',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,

        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await player.play(UrlSource(radio.url ?? ''));
              },
              icon: Icon(
                Icons.not_started_outlined,
                size: 35,
                color: provider.appTheme == ThemeMode.light?
                AppColors.primaryLightColor:
                AppColors.yellowColor,
              ),
            ),
            SizedBox(width: 30),
            IconButton(
              onPressed: () async {
                await player.pause();
              },
              icon: Icon(
                Icons.stop_circle_outlined,
                size: 35,
                color: provider.appTheme == ThemeMode.light?
                AppColors.primaryLightColor:
                AppColors.yellowColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
