// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Covid covidFromJson(String str) => Covid.fromMap(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toMap());

class Covid {
  final String country;
  final int cases;
  final int confirmed;
  final int deaths;
  final int recovered;
  final DateTime updatedAt;

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

  // @override
  // List<Object> get props => [
  //       country,
  //       cases,
  //       confirmed,
  //       deaths,
  //       recovered,
  //       updatedAt,
  //     ];

  @override
  String toString() {
    return 'Covid(country: $country, cases: $cases, confirmed: $confirmed, deaths: $deaths, recovered: $recovered, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Covid &&
        o.country == country &&
        o.cases == cases &&
        o.confirmed == confirmed &&
        o.deaths == deaths &&
        o.recovered == recovered &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        cases.hashCode ^
        confirmed.hashCode ^
        deaths.hashCode ^
        recovered.hashCode ^
        updatedAt.hashCode;
  }
}
