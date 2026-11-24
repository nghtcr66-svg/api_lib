import 'package:collection/collection.dart';

class JoinGameRequestModel {
  bool? reminderEnabled;

  JoinGameRequestModel({this.reminderEnabled});

  @override
  String toString() {
    return 'JoinGameRequestModel(reminderEnabled: $reminderEnabled)';
  }

  factory JoinGameRequestModel.fromJson(Map<String, dynamic> json) {
    return JoinGameRequestModel(
      reminderEnabled: json['reminder_enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {'reminder_enabled': reminderEnabled};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! JoinGameRequestModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => reminderEnabled.hashCode;
}
