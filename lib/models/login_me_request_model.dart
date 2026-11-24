import 'package:collection/collection.dart';

class LoginMeRequestModel {
  String? email;
  String? password;

  LoginMeRequestModel({this.email, this.password});

  factory LoginMeRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginMeRequestModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginMeRequestModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
