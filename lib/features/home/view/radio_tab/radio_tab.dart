import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/data/radio_data.dart';
import 'package:untitled/features/home/widgets/radio_items.dart';
import 'package:untitled/models/radio_model.dart';
import '../../../../core/constants/app_colors.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            bottom: MediaQuery.of(context).size.height * 0.04,
          ),
          child: Image.asset('assets/images/radio_image.png'),
        ),
        Expanded(
          child: FutureBuilder<List<RadioModel>>(
            future: RadioData().getRadioData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('حدث خطأ: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: const Text('لا توجد إذاعات متاحة حالياً'));
              } else {
                final radios = snapshot.data!;
                return PageView.builder(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: radios.length,
                  itemBuilder: (context, index) {
                    return RadioItems(player: player, radio: radios[index]);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
