
import 'package:flutter_test/flutter_test.dart';
import 'package:android/domain/models/clothes/cloth.dart';

void main() {
  group('Cloth.fromJson', () {
    final json = {
      'id': 'dlxLGIy-2VU',
      'created_at': '2017-03-25T22:42:07Z',
      'updated_at': '2026-10-17T04:19:31Z',
      'promoted_at': '2017-03-26T08:16:30Z',
      'width': 5472,
      'height': 3648,
      'color': '#d9d9d9',
      'urls': {
        'raw': 'https://images.unsplash.com/raw-image',
        'regular': 'https://images.unsplash.com/regular-image',
        'small': 'https://images.unsplash.com/small-image',
      },
      'slug': 'assorted-clothes-in-wooden-hangers',
      'alt_description': 'assorted clothes in wooden hangers',
      'short_description': null,
      'user': {
        'id':"vISVsyltI4M", 
        'username': 'priscilladupreez',
        "name": "Priscilla Du Preez 🇨🇦",
      },
    };

    test('should correctly parse JSON into Cloth', () {
      final cloth = Cloth.fromJson(json);

      expect(cloth.id, 'dlxLGIy-2VU');
      expect(
        cloth.createdAt,
        DateTime.parse('2017-03-25T22:42:07Z'),
      );
      expect(
        cloth.updatedAt,
        DateTime.parse('2026-10-17T04:19:31Z'),
      );
      expect(
        cloth.promotedAt,
        DateTime.parse('2017-03-26T08:16:30Z'),
      );
      expect(cloth.width, 5472);
      expect(cloth.height, 3648);
      expect(cloth.color, '#d9d9d9');
      expect(
        cloth.urls.raw,
        'https://images.unsplash.com/raw-image',
      );
      expect(
        cloth.urls.regular,
        'https://images.unsplash.com/regular-image',
      );
      expect(
        cloth.urls.small,
        'https://images.unsplash.com/small-image',
      );
      expect(
        cloth.slug,
        'assorted-clothes-in-wooden-hangers',
      );
      expect(
        cloth.altDescription,
        'assorted clothes in wooden hangers',
      );
      expect(cloth.shortDescription, isNull);
      expect(cloth.user.username, 'priscilladupreez');
      expect(cloth.user.name, 'Priscilla Du Preez 🇨🇦');
    });

    test('should parse null promoted_at', () {
      final data = Map<String, dynamic>.from(json)
        ..['promoted_at'] = null;

      final cloth = Cloth.fromJson(data);

      expect(cloth.promotedAt, isNull);
    });
  });
}

