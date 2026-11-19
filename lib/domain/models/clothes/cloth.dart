//alt_description itu jadi judul aja
//short-description dipake untuk deskripsi atau bisa gausah, ambil color aja untuk menggantikan short-description
//ambil raw image di urls -> regular
//ambil user -> username

import 'package:android/domain/models/clothes/link.dart';
import 'package:android/domain/models/clothes/url.dart';
import 'package:android/domain/models/clothes/user.dart';

class Cloth {
  String id;
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
  Link link;

  Cloth({
    required this.id,
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
    required this.link,
  });

  factory Cloth.fromJson(Map<String, dynamic> json) {
    return Cloth(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      promotedAt: json['promoted_at'] != null
          ? DateTime.parse(json['promoted_at'] as String)
          : null,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      urls: Url.fromJson(json['urls'] as Map<String, dynamic>),
      slug: json['slug'] as String,
      altDescription: json['alt_description'] as String?,
      shortDescription: json['description'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      link: Link.fromJson(json['links'] as Map<String, dynamic>),
    );
  }

  static List<Cloth> parseList(dynamic list) {
      return (list as List<dynamic>)
        .map((item) => Cloth.fromJson(item as Map<String, dynamic>))
        .toList();
    }
  // factory Cloth.fromJson(Map<String, dynamic> json) => Cloth(
  //       id: json['id'] as String,
  //       // alternative_slugs: AlternativeSlug.fromJson(json['alternative_slugs']),
  //       createdAt: DateTime.parse(json['created_at']),
  //       updatedAt: DateTime.parse(json['updated_at']),
  //       promotedAt: json['promoted_at'] != null
  //           ? DateTime.parse(json['promoted_at'])
  //           : null,
  //       width: json['width'] as int,
  //       height: json['height'] as int,
  //       color: json['color'] as String,
  //       urls: Url.fromJson(json['urls']),
  //       slug: json['slug'] as String,
  //       altDescription: json['alt_description'] as String?,
  //       shortDescription: json['short_description'] as String?,
  //       user: User.fromJson(json['user']),
  //     );
}
