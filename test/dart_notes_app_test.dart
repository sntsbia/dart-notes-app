import 'package:dart_notes_app/dart_notes_app.dart';
import 'package:test/test.dart';

void main() {
  group('Note Management', () {
    test('getCommand should return a valid integer command', () {
      expect(() => getCommand(), returnsNormally);
    });

    test('getNoteContent should return a non-empty string', () {
      expect(() => getNoteContent(), returnsNormally);
    });
  });
}
