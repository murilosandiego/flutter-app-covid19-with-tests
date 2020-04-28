import 'package:covid_19/app/shared/exceptions/server_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServerException', () {
    test('should ServerException is a Exception', () {
      final ex = ServerException();
      expect(ex, isException);
    });

    test('should returns a default  toString()', () {
      final ex = ServerException();

      expect(ex.toString(), equals('ServerException'));
    });

    test('should returns a custom message', () {
      final ex = ServerException('Custom message');

      expect(ex.toString(), equals('Custom message'));
    });
  });
}
