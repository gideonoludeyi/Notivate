import 'package:flutter/material.dart';
import 'package:notivate/models/note.dart';
import 'package:notivate/views/components/note_feed_list.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.title});

  final String title;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: NoteFeedList(
          notes: notes,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Write',
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }

  final List<Note> notes = List.of(const [
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
