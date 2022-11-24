// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(
    json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.watched,
    required this.tittle,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String tittle;
  String rating;
  DateTime releaseDate;
  String review;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        watched: json["watched"],
        tittle: json["tittle"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["fields"]["release_date"]),
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "userId": watched,
        "id": tittle,
        "title": rating,
        "completed":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
      };
}
