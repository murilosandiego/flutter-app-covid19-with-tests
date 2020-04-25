// To parse this JSON data, do
//
//     final covidState = covidStateFromJson(jsonString);

import 'dart:convert';

CovidState covidStateFromJson(String str) =>
    CovidState.fromMap(json.decode(str));

String covidStateToJson(CovidState data) => json.encode(data.toMap());

class CovidState {
  int uid;
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  DateTime datetime;
  double lat;
  double log;

  CovidState({
    this.uid,
    this.uf,
    this.state,
    this.cases,
    this.deaths,
    this.suspects,
    this.refuses,
    this.datetime,
    this.lat,
    this.log,
  });

  CovidState copyWith({
    int uid,
    String uf,
    String state,
    int cases,
    int deaths,
    int suspects,
    int refuses,
    DateTime datetime,
    double lat,
    double log,
  }) =>
      CovidState(
        uid: uid ?? this.uid,
        uf: uf ?? this.uf,
        state: state ?? this.state,
        cases: cases ?? this.cases,
        deaths: deaths ?? this.deaths,
        suspects: suspects ?? this.suspects,
        refuses: refuses ?? this.refuses,
        datetime: datetime ?? this.datetime,
        lat: lat ?? this.lat,
        log: log ?? this.log,
      );

  factory CovidState.fromMap(Map<String, dynamic> json) => CovidState(
        uid: json["uid"],
        uf: json["uf"],
        state: json["state"],
        cases: json["cases"],
        deaths: json["deaths"],
        suspects: json["suspects"],
        refuses: json["refuses"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "uf": uf,
        "state": state,
        "cases": cases,
        "deaths": deaths,
        "suspects": suspects,
        "refuses": refuses,
        "datetime": datetime.toIso8601String(),
      };

  @override
  String toString() {
    return 'CovidState(uid: $uid, uf: $uf, state: $state, cases: $cases, deaths: $deaths, suspects: $suspects, refuses: $refuses, datetime: $datetime, lat: $lat, log: $log)';
  }
}
