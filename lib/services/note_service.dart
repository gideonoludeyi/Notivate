class NoteService {
  final List<Note> _notes = List.of(const [
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

  List<Note> findAllNotes() {
    return _notes;
  }
}

class Note {
  final String id;
  final String title;
  final String subtitle;

  const Note({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}
