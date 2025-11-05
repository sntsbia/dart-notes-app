import 'package:dart_notes_app/dart_notes_app.dart';
import 'package:test/test.dart';

void main() {
  group('Notes App Logic', () {
    group('addNote', () {
      test('should add a note to an empty list', () {
        final notes = <String>[];
        final newNote = 'First note';
        final result = addNote(notes, newNote);
        expect(result, equals(['First note']));
      });

      test('should add a note to an existing list of notes', () {
        final notes = ['First note'];
        final newNote = 'Second note';
        final result = addNote(notes, newNote);
        expect(result, equals(['First note', 'Second note']));
      });
    });

    group('deleteNote', () {
      test('should delete a note from the list with a valid index', () {
        final notes = ['First note', 'Second note', 'Third note'];
        final indexToDelete = 1; // 'Second note'
        final result = deleteNote(notes, indexToDelete);
        expect(result, equals(['First note', 'Third note']));
      });

      test(
        'should not change the list if index is out of bounds (negative)',
        () {
          final notes = ['First note', 'Second note'];
          final indexToDelete = -1;
          final result = deleteNote(notes, indexToDelete);
          expect(result, equals(['First note', 'Second note']));
        },
      );

      test(
        'should not change the list if index is out of bounds (greater than length)',
        () {
          final notes = ['First note', 'Second note'];
          final indexToDelete = 2;
          final result = deleteNote(notes, indexToDelete);
          expect(result, equals(['First note', 'Second note']));
        },
      );

      test('should handle deleting from an empty list', () {
        final notes = <String>[];
        final indexToDelete = 0;
        final result = deleteNote(notes, indexToDelete);
        expect(result, isEmpty);
      });
    });

    group('viewNotes', () {
      test('should print a message when there are no notes', () {
        final notes = <String>[];
        expect(
          () => viewNotes(notes),
          prints('\nNotes:\nNo notes available.\n'),
        );
      });

      test('should print all notes when the list is not empty', () {
        final notes = ['Buy milk', 'Walk the dog'];
        expect(
          () => viewNotes(notes),
          prints('\nNotes:\n1: Buy milk\n2: Walk the dog\n'),
        );
      });
    });
  });
}
