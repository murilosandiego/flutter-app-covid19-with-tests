// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromMap(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toMap());

class Covid {
  String country;
  int cases;
  int confirmed;
  int deaths;
  int recovered;
  DateTime updatedAt;

  Covid({
    this.country,
    this.cases,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.updatedAt,
  });

  Covid copyWith({
    String country,
    int cases,
    int confirmed,
    int deaths,
    int recovered,
    DateTime updatedAt,
  }) =>
      Covid(
        country: country ?? this.country,
        cases: cases ?? this.cases,
        confirmed: confirmed ?? this.confirmed,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Covid.fromMap(Map<String, dynamic> json) => Covid(
        country: json["country"],
        cases: json["cases"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        recovered: json["recovered"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "cases": cases,
        "confirmed": confirmed,
        "deaths": deaths,
        "recovered": recovered,
        "updated_at": updatedAt.toIso8601String(),
      };
}
