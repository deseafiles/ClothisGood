import 'package:flutter_test/flutter_test.dart';
import 'package:android/domain/models/weathers/daily.dart';

void main() {
  group('Daily.fromJson', () {
    test('should parse JSON into Daily object', () {
      // Arrange
      final json = {
        'time': ['2026-10-16', '2026-10-17'],
        'temperature2mMax': [30.5, 31.0],
        'temperature2mMin': [24, 25],
      };

      // Act
      final daily = Daily.fromJson(json);

      // Assert
      expect(daily.time, ['2026-10-16', '2026-10-17']);
      expect(daily.temperature2mMax, [30.5, 31.0]);
      expect(daily.temperature2mMin, [24, 25]);
    });
  });
}

