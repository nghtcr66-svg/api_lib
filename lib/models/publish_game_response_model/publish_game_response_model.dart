import 'package:collection/collection.dart';

import 'participant.dart';
import 'result.dart';

class PublishGameResponseModel {
  int? id;
  String? name;
  String? category;
  String? status;
  int? winningPoints;
  DateTime? startsAt;
  DateTime? endsAt;
  DateTime? createdAt;
  List<Participant>? participants;
  String? description;
  bool? canJoin;
  bool? reminderEnabled;
  Result? result;

  PublishGameResponseModel({
    this.id,
    this.name,
    this.category,
    this.status,
    this.winningPoints,
    this.startsAt,
    this.endsAt,
    this.createdAt,
    this.participants,
    this.description,
    this.canJoin,
    this.reminderEnabled,
    this.result,
  });

  @override
  String toString() {
    return 'PublishGameResponseModel(id: $id, name: $name, category: $category, status: $status, winningPoints: $winningPoints, startsAt: $startsAt, endsAt: $endsAt, createdAt: $createdAt, participants: $participants, description: $description, canJoin: $canJoin, reminderEnabled: $reminderEnabled, result: $result)';
  }

  factory PublishGameResponseModel.fromJson(Map<String, dynamic> json) {
    return PublishGameResponseModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      status: json['status'] as String?,
      winningPoints: json['winning_points'] as int?,
      startsAt: json['starts_at'] == null
          ? null
          : DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      canJoin: json['can_join'] as bool?,
      reminderEnabled: json['reminder_enabled'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'status': status,
    'winning_points': winningPoints,
    'starts_at': startsAt?.toIso8601String(),
    'ends_at': endsAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'participants': participants?.map((e) => e.toJson()).toList(),
    'description': description,
    'can_join': canJoin,
    'reminder_enabled': reminderEnabled,
    'result': result?.toJson(),
  };

  PublishGameResponseModel copyWith({
    int? id,
    String? name,
    String? category,
    String? status,
    int? winningPoints,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? createdAt,
    List<Participant>? participants,
    String? description,
    bool? canJoin,
    bool? reminderEnabled,
    Result? result,
  }) {
    return PublishGameResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      status: status ?? this.status,
      winningPoints: winningPoints ?? this.winningPoints,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      createdAt: createdAt ?? this.createdAt,
      participants: participants ?? this.participants,
      description: description ?? this.description,
      canJoin: canJoin ?? this.canJoin,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      result: result ?? this.result,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PublishGameResponseModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      category.hashCode ^
      status.hashCode ^
      winningPoints.hashCode ^
      startsAt.hashCode ^
      endsAt.hashCode ^
      createdAt.hashCode ^
      participants.hashCode ^
      description.hashCode ^
      canJoin.hashCode ^
      reminderEnabled.hashCode ^
      result.hashCode;
}
