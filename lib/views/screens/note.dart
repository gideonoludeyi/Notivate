import 'package:flutter/material.dart';
import 'package:notivate/services/note_service.dart';

class NoteScreen extends StatelessWidget {
  final String noteId;
  final NoteService noteService;

  const NoteScreen({
    super.key,
    required this.noteId,
    required this.noteService,
  });

  @override
  Widget build(BuildContext context) {
    Note? note = noteService.findNoteById(noteId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: Text(note?.title ?? "Unknown"),
    );
  }
}
