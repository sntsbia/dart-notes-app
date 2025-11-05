import 'package:dart_notes_app/utils/io_utils.dart';

void runDartNotesApp() {
  print('\nWelcome to Dart Notes App!\n');

  List<String> notes = <String>[];

  while (true) {
    int command = getCommand();

    switch (command) {
      case 1:
        String noteContent = getNoteContent();
        notes = addNote(notes, noteContent);
        print('Notes: $notes\n');
        break;
      case 2:
        viewNotes(notes);
        break;
      case 3:
        int index =
            integerFromInput(
              "Enter the note number to delete:",
              List<int>.generate(notes.length, (i) => i + 1),
            ) -
            1;
        notes = deleteNote(notes, index);
        print('Notes: $notes\n');
        break;
      case 4:
        print('Exiting...');
        return;
    }
    print('');
  }
}

int getCommand() {
  return integerFromInput(
    "Enter a command:\n1 - Add Note\n2 - View Notes\n3 - Delete Note\n4 - Exit",
    [1, 2, 3, 4],
  );
}

String getNoteContent() {
  return stringFromInput("Enter note content:", []);
}

List<String> addNote(List<String> notes, String noteContent) {
  notes.add(noteContent);
  return notes;
}

List<String> deleteNote(List<String> notes, int index) {
  if (index >= 0 && index < notes.length) {
    notes.removeAt(index);
  }
  return notes;
}

void viewNotes(List<String> notes) {
  print('\nNotes:');
  if (notes.isEmpty) {
    print('No notes available.');
  } else {
    for (int i = 0; i < notes.length; i++) {
      print('${i + 1}: ${notes[i]}');
    }
    // for (String note in notes) {
    //   print('- $note');
    // }
  }
}
