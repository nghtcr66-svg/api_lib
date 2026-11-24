import 'package:collection/collection.dart';

class RegisterRequestModel {
  String? email;
  String? fullName;
  String? password;
  String? phone;
  String? username;

  RegisterRequestModel({
    this.email,
    this.fullName,
    this.password,
    this.phone,
    this.username,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'full_name': fullName,
    'password': password,
    'phone': phone,
    'username': username,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RegisterRequestModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      email.hashCode ^
      fullName.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      username.hashCode;
}
