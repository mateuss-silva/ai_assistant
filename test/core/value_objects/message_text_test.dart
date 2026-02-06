import 'package:ai_assistant/core/error/error.dart';
import 'package:ai_assistant/core/value_objects/message_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MessageText', () {
    test('should create a valid MessageText', () {
      const input = 'This is a valid message';
      final result = MessageText.create(input);

      expect(result.isRight(), true);
      result.fold((l) => fail('Should work'), (r) => expect(r.value, input));
    });

    test('should fail when message is empty', () {
      final result = MessageText.create('');

      expect(result.isLeft(), true);
      result.fold((l) => expect(l, isA<Failure>()), (r) => fail('Should fail'));
    });

    test('should fail when message is too short', () {
      final result = MessageText.create('Hi');

      expect(result.isLeft(), true);
      result.fold((l) => expect(l, isA<Failure>()), (r) => fail('Should fail'));
    });

    test('should trim the input', () {
      const input = '  Trim me  ';
      final result = MessageText.create(input);

      result.fold(
        (l) => fail('Should work'),
        (r) => expect(r.value, 'Trim me'),
      );
    });
  });
}
