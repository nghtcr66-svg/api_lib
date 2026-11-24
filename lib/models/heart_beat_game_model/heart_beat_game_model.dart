import 'package:collection/collection.dart';

import 'result.dart';

class HeartBeatGameModel {
  String? status;
  DateTime? serverTime;
  Result? result;

  HeartBeatGameModel({this.status, this.serverTime, this.result});

  factory HeartBeatGameModel.fromJson(Map<String, dynamic> json) {
    return HeartBeatGameModel(
      status: json['status'] as String?,
      serverTime: json['server_time'] == null
          ? null
          : DateTime.parse(json['server_time'] as String),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'server_time': serverTime?.toIso8601String(),
    'result': result?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HeartBeatGameModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ serverTime.hashCode ^ result.hashCode;
}
