import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/models/radio_model.dart';

class RadioData {
  Future<List<RadioModel>> getRadioData() async {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
    var response = await http.get(url);
    try {
      var json = jsonDecode(response.body);
      List<dynamic> radiosJson = json['radios']; // استخراج المصفوفة
      List<RadioModel> radios = radiosJson
          .map((radioJson) => RadioModel.fromJson(radioJson))
          .toList();
      return radios;
    } catch (e) {
      rethrow;
    }
  }
}
