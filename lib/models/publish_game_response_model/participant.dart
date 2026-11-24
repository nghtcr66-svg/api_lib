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

  @override
  String toString() {
    return 'Participant(id: $id, fullName: $fullName, username: $username, avatarUrl: $avatarUrl, role: $role)';
  }

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

  Participant copyWith({
    int? id,
    String? fullName,
    String? username,
    String? avatarUrl,
    String? role,
  }) {
    return Participant(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
    );
  }

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
