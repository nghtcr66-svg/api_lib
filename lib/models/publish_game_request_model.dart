import 'package:collection/collection.dart';

class PublishGameRequestModel {
  String? category;
  String? description;
  String? endsAt;
  String? name;
  bool? reminderEnabled;
  String? startsAt;
  int? winningPoints;

  PublishGameRequestModel({
    this.category,
    this.description,
    this.endsAt,
    this.name,
    this.reminderEnabled,
    this.startsAt,
    this.winningPoints,
  });

  @override
  String toString() {
    return 'PublishGameRequestModel(category: $category, description: $description, endsAt: $endsAt, name: $name, reminderEnabled: $reminderEnabled, startsAt: $startsAt, winningPoints: $winningPoints)';
  }

  factory PublishGameRequestModel.fromJson(Map<String, dynamic> json) {
    return PublishGameRequestModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      endsAt: json['ends_at'] as String?,
      name: json['name'] as String?,
      reminderEnabled: json['reminder_enabled'] as bool?,
      startsAt: json['starts_at'] as String?,
      winningPoints: json['winning_points'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'description': description,
    'ends_at': endsAt,
    'name': name,
    'reminder_enabled': reminderEnabled,
    'starts_at': startsAt,
    'winning_points': winningPoints,
  };

  PublishGameRequestModel copyWith({
    String? category,
    String? description,
    String? endsAt,
    String? name,
    bool? reminderEnabled,
    String? startsAt,
    int? winningPoints,
  }) {
    return PublishGameRequestModel(
      category: category ?? this.category,
      description: description ?? this.description,
      endsAt: endsAt ?? this.endsAt,
      name: name ?? this.name,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      startsAt: startsAt ?? this.startsAt,
      winningPoints: winningPoints ?? this.winningPoints,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PublishGameRequestModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      category.hashCode ^
      description.hashCode ^
      endsAt.hashCode ^
      name.hashCode ^
      reminderEnabled.hashCode ^
      startsAt.hashCode ^
      winningPoints.hashCode;
}
