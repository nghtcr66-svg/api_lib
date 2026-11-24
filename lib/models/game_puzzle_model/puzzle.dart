import 'package:collection/collection.dart';

class Puzzle {
  String? category;
  String? imageUrl;
  int? size;
  List<int>? tiles;

  Puzzle({this.category, this.imageUrl, this.size, this.tiles});

  factory Puzzle.fromJson(Map<String, dynamic> json) => Puzzle(
    category: json['category'] as String?,
    imageUrl: json['image_url'] as String?,
    size: json['size'] as int?,
    tiles: json['tiles'] as List<int>?,
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'image_url': imageUrl,
    'size': size,
    'tiles': tiles,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Puzzle) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      category.hashCode ^ imageUrl.hashCode ^ size.hashCode ^ tiles.hashCode;
}
