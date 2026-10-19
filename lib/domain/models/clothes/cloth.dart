//alt_description itu jadi judul aja
//short-description dipake untuk deskripsi atau bisa gausah, ambil color aja untuk menggantikan short-description
//ambil raw image di urls -> regular
//ambil user -> username

import 'package:android/domain/models/clothes/url.dart';
import 'package:android/domain/models/clothes/user.dart';

class Cloth {
  String id;
  // AlternativeSlug alternative_slugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  Url urls;
  String slug;
  String? altDescription;
  String? shortDescription;
  User user;

  Cloth({
    required this.id,
    // required this.alternative_slugs,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.urls,
    required this.slug,
    this.altDescription,
    this.shortDescription,
    required this.user,
  });

  factory Cloth.fromJson(Map<String, dynamic> json) => Cloth(
        id: json['id'] as String,
        // alternative_slugs: AlternativeSlug.fromJson(json['alternative_slugs']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        promotedAt: json['promoted_at'] != null
            ? DateTime.parse(json['promoted_at'])
            : null,
        width: json['width'] as int,
        height: json['height'] as int,
        color: json['color'] as String,
        urls: Url.fromJson(json['urls']),
        slug: json['slug'] as String,
        altDescription: json['alt_description'] as String?,
        shortDescription: json['short_description'] as String?,
        user: User.fromJson(json['user']),
      );
}
