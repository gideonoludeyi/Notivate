import 'package:flutter/material.dart';
import 'package:notivate/models/note.dart';

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
        );
      },
    );
  }
}

class NoteFeedListItem extends StatelessWidget {
  final Note note;

  const NoteFeedListItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.subtitle),
      ),
    );
  }
}
