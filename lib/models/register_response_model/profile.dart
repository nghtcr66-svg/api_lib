import 'package:collection/collection.dart';

class Profile {
  int? id;
  String? fullName;
  String? username;
  String? avatarUrl;
  String? email;
  String? phone;

  Profile({
    this.id,
    this.fullName,
    this.username,
    this.avatarUrl,
    this.email,
    this.phone,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json['id'] as int?,
    fullName: json['full_name'] as String?,
    username: json['username'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'username': username,
    'avatar_url': avatarUrl,
    'email': email,
    'phone': phone,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Profile) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      username.hashCode ^
      avatarUrl.hashCode ^
      email.hashCode ^
      phone.hashCode;
}
