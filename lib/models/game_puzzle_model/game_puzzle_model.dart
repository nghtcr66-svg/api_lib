import 'package:collection/collection.dart';

import 'puzzle.dart';

class GamePuzzleModel {
  int? puzzleId;
  DateTime? startsAt;
  DateTime? endsAt;
  DateTime? serverTime;
  Puzzle? puzzle;

  GamePuzzleModel({
    this.puzzleId,
    this.startsAt,
    this.endsAt,
    this.serverTime,
    this.puzzle,
  });

  factory GamePuzzleModel.fromJson(Map<String, dynamic> json) {
    return GamePuzzleModel(
      puzzleId: json['puzzle_id'] as int?,
      startsAt: json['starts_at'] == null
          ? null
          : DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
      serverTime: json['server_time'] == null
          ? null
          : DateTime.parse(json['server_time'] as String),
      puzzle: json['puzzle'] == null
          ? null
          : Puzzle.fromJson(json['puzzle'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'puzzle_id': puzzleId,
    'starts_at': startsAt?.toIso8601String(),
    'ends_at': endsAt?.toIso8601String(),
    'server_time': serverTime?.toIso8601String(),
    'puzzle': puzzle?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GamePuzzleModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      puzzleId.hashCode ^
      startsAt.hashCode ^
      endsAt.hashCode ^
      serverTime.hashCode ^
      puzzle.hashCode;
}
