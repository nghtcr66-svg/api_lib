import 'package:collection/collection.dart';

class GetMeModel {
  int? id;
  String? fullName;
  String? username;
  String? avatarUrl;
  String? email;
  String? phone;

  GetMeModel({
    this.id,
    this.fullName,
    this.username,
    this.avatarUrl,
    this.email,
    this.phone,
  });

  @override
  String toString() {
    return 'GetMeModel(id: $id, fullName: $fullName, username: $username, avatarUrl: $avatarUrl, email: $email, phone: $phone)';
  }

  factory GetMeModel.fromJson(Map<String, dynamic> json) => GetMeModel(
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

  GetMeModel copyWith({
    int? id,
    String? fullName,
    String? username,
    String? avatarUrl,
    String? email,
    String? phone,
  }) {
    return GetMeModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetMeModel) return false;
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
