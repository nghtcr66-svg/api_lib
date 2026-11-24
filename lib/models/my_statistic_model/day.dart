import 'dart:convert';

import 'package:collection/collection.dart';

class Day {
  String? date;
  int? earnedPoints;
  int? scheduledGames;

  Day({this.date, this.earnedPoints, this.scheduledGames});

  factory Day.fromMap(Map<String, dynamic> data) => Day(
    date: data['date'] as String?,
    earnedPoints: data['earned_points'] as int?,
    scheduledGames: data['scheduled_games'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'date': date,
    'earned_points': earnedPoints,
    'scheduled_games': scheduledGames,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Day].
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Day] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Day) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      date.hashCode ^ earnedPoints.hashCode ^ scheduledGames.hashCode;
}
