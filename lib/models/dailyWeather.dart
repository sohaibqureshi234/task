import 'package:flutter/cupertino.dart';

class DailyWeather with ChangeNotifier {
  final dynamic dailyTemp;
  final String? condition;
  final DateTime? date;


  DailyWeather({
    this.dailyTemp,
    this.condition,
    this.date,
  });

  static DailyWeather fromDailyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['main']['temp'].toDouble(), condition: json['weather'][0]['main'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
    );
  }
}
