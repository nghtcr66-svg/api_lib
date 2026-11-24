import 'dart:convert';

import 'package:collection/collection.dart';

class WinsByCategory {
  int? additionalProp1;
  int? additionalProp2;
  int? additionalProp3;

  WinsByCategory({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

  factory WinsByCategory.fromMap(Map<String, dynamic> data) {
    return WinsByCategory(
      additionalProp1: data['additionalProp1'] as int?,
      additionalProp2: data['additionalProp2'] as int?,
      additionalProp3: data['additionalProp3'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
    'additionalProp1': additionalProp1,
    'additionalProp2': additionalProp2,
    'additionalProp3': additionalProp3,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WinsByCategory].
  factory WinsByCategory.fromJson(String data) {
    return WinsByCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WinsByCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WinsByCategory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      additionalProp1.hashCode ^
      additionalProp2.hashCode ^
      additionalProp3.hashCode;
}
