import 'package:notivate/models/note.dart';
import 'package:notivate/services/note_service.dart';

class InMemoryNoteService implements NoteService {
  @override
  Stream<List<Note>> get notes$ => Stream.value(const [
        Note(
          id: "1",
          title: "Hello World",
          subtitle: "lorem ipsum dolor sit amet",
        ),
        Note(
          id: "2",
          title: "Data Structures: LinkedList",
          subtitle: "LinkedList is one of the more common data structures...",
        ),
        Note(
          id: "3",
          title: "Favor Composition over Inheritance",
          subtitle: "OOP Design Principles - Part 007",
        ),
      ]);
}
