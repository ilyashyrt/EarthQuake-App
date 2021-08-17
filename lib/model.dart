// To parse this JSON data, do
//
//     final earthQuakeData = earthQuakeDataFromJson(jsonString);

import 'dart:convert';

EarthQuakeData earthQuakeDataFromJson(String str) =>
    EarthQuakeData.fromJson(json.decode(str));

String earthQuakeDataToJson(EarthQuakeData data) => json.encode(data.toJson());

class EarthQuakeData {
  EarthQuakeData({
    this.status,
    this.result,
  });

  bool status;
  List<Result> result;

  factory EarthQuakeData.fromJson(Map<String, dynamic> json) => EarthQuakeData(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.mag,
    this.lokasyon,
    this.title,
    this.date,
    this.lng,
    this.lat,
  });

  double mag;
  String lokasyon;
  String title;
  String date;
  double lng;
  double lat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mag: json["mag"].toDouble(),
        lokasyon: json["lokasyon"],
        title: json["title"],
        date: json["date"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "mag": mag,
        "lokasyon": lokasyon,
        "title": title,
        "date": date,
        "lng": lng,
        "lat": lat,
      };
}
