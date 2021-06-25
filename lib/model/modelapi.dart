// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.ad,
    this.soyad,
  });

  String ad;
  String soyad;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        ad: json["adı"],
        soyad: json["soyadı"],
      );

  Map<String, dynamic> toJson() => {
        "adı": ad,
        "soyadı": soyad,
      };
}
