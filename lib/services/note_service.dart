import 'package:notivate/models/note.dart';

abstract class NoteService {
  Stream<List<Note>> get notes$;
}
