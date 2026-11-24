import 'dart:convert';

import 'package:collection/collection.dart';

import 'day.dart';
import 'wins_by_category.dart';

class MyStatisticModel {
  String? weekStart;
  String? weekEnd;
  String? timezone;
  int? earnedPoints;
  WinsByCategory? winsByCategory;
  int? playedGames;
  int? winRate;
  List<Day>? days;

  MyStatisticModel({
    this.weekStart,
    this.weekEnd,
    this.timezone,
    this.earnedPoints,
    this.winsByCategory,
    this.playedGames,
    this.winRate,
    this.days,
  });

  factory MyStatisticModel.fromMap(Map<String, dynamic> data) {
    return MyStatisticModel(
      weekStart: data['week_start'] as String?,
      weekEnd: data['week_end'] as String?,
      timezone: data['timezone'] as String?,
      earnedPoints: data['earned_points'] as int?,
      winsByCategory: data['wins_by_category'] == null
          ? null
          : WinsByCategory.fromMap(
              data['wins_by_category'] as Map<String, dynamic>,
            ),
      playedGames: data['played_games'] as int?,
      winRate: data['win_rate'] as int?,
      days: (data['days'] as List<dynamic>?)
          ?.map((e) => Day.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
    'week_start': weekStart,
    'week_end': weekEnd,
    'timezone': timezone,
    'earned_points': earnedPoints,
    'wins_by_category': winsByCategory?.toMap(),
    'played_games': playedGames,
    'win_rate': winRate,
    'days': days?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyStatisticModel].
  factory MyStatisticModel.fromJson(String data) {
    return MyStatisticModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyStatisticModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MyStatisticModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      weekStart.hashCode ^
      weekEnd.hashCode ^
      timezone.hashCode ^
      earnedPoints.hashCode ^
      winsByCategory.hashCode ^
      playedGames.hashCode ^
      winRate.hashCode ^
      days.hashCode;
}
