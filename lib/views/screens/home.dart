import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/services/note_service.dart' show NoteService, Note;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.noteService,
  });

  final String title;
  final NoteService noteService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: NoteFeedList(
          notes: widget.noteService.findAllNotes(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Write',
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}

class NoteFeedList extends StatelessWidget {
  const NoteFeedList({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];

        return NoteFeedListItem(
          key: ValueKey(note.id),
          note: note,
          onTap: () => context.push('/note'),
        );
      },
    );
  }
}

class NoteFeedListItem extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const NoteFeedListItem({
    super.key,
    required this.note,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.subtitle),
        onTap: onTap,
      ),
    );
  }
}
