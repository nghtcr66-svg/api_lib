import 'package:collection/collection.dart';

import 'profile.dart';

class LoginMeResponseModel {
  String? accessToken;
  String? tokenType;
  DateTime? expiresAt;
  Profile? profile;

  LoginMeResponseModel({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.profile,
  });

  factory LoginMeResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginMeResponseModel(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
    'expires_at': expiresAt?.toIso8601String(),
    'profile': profile?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginMeResponseModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^
      tokenType.hashCode ^
      expiresAt.hashCode ^
      profile.hashCode;
}
