import 'package:collection/collection.dart';

class Participant {
  int? id;
  String? fullName;
  String? username;
  String? avatarUrl;
  String? role;

  Participant({
    this.id,
    this.fullName,
    this.username,
    this.avatarUrl,
    this.role,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json['id'] as int?,
    fullName: json['full_name'] as String?,
    username: json['username'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'username': username,
    'avatar_url': avatarUrl,
    'role': role,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Participant) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      username.hashCode ^
      avatarUrl.hashCode ^
      role.hashCode;
}
