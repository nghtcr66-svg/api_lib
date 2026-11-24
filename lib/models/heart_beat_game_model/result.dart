import 'package:collection/collection.dart';

class Result {
  int? winnerId;
  String? reason;
  DateTime? finishedAt;
  int? durationMs;
  int? points;

  Result({
    this.winnerId,
    this.reason,
    this.finishedAt,
    this.durationMs,
    this.points,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    winnerId: json['winner_id'] as int?,
    reason: json['reason'] as String?,
    finishedAt: json['finished_at'] == null
        ? null
        : DateTime.parse(json['finished_at'] as String),
    durationMs: json['duration_ms'] as int?,
    points: json['points'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'winner_id': winnerId,
    'reason': reason,
    'finished_at': finishedAt?.toIso8601String(),
    'duration_ms': durationMs,
    'points': points,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      winnerId.hashCode ^
      reason.hashCode ^
      finishedAt.hashCode ^
      durationMs.hashCode ^
      points.hashCode;
}
