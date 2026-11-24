import 'package:collection/collection.dart';

class InfoModel {
  int? id;
  String? fullName;
  String? username;
  String? avatarUrl;
  List<String>? categories;
  int? earnedPoints;

  InfoModel({
    this.id,
    this.fullName,
    this.username,
    this.avatarUrl,
    this.categories,
    this.earnedPoints,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
    id: json['id'] as int?,
    fullName: json['full_name'] as String?,
    username: json['username'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    categories: json['categories'] as List<String>?,
    earnedPoints: json['earned_points'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'username': username,
    'avatar_url': avatarUrl,
    'categories': categories,
    'earned_points': earnedPoints,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! InfoModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      username.hashCode ^
      avatarUrl.hashCode ^
      categories.hashCode ^
      earnedPoints.hashCode;
}
