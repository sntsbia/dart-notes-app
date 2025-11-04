import 'package:dart_notes_app/utils/io_utils.dart';

void runDartNotesApp() {
  print('\nWelcome to Dart Notes App!\n');

  List<String> notes = [];

  while (true) {
    int command = getCommand();

    if (command == 1) {
      String noteContent = getNoteContent();
      notes.add(noteContent);
      print('Note added: $noteContent');
      print('Notes: $notes');
    } else if (command == 2) {
      print('Viewing notes...');
    } else if (command == 3) {
      print('Deleting note...');
    } else if (command == 4) {
      print('Exiting...');
      break;
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
