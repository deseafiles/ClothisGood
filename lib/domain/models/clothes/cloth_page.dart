import 'package:android/domain/models/clothes/cloth.dart';

class ClothPage {
  final int page;
  final List<Cloth> clothes;
  final int totalPages;
  final int total;

  const ClothPage({
    this.page = 1,
    required this.clothes,
    this.totalPages = 1,
    this.total = 0,
  });

  factory ClothPage.fromJson(Map<String, dynamic> json) {
    return ClothPage(
      page: json['page'] as int? ?? 1,
      clothes: Cloth.parseList(json['results']),
      totalPages: json['total_pages'] as int? ?? 1,
      total: json['total'] as int? ?? 0,
    );
  }
}
