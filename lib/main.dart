import 'package:flutter/material.dart';
import 'package:notivate/services/note_service.dart';

import 'views/app.dart';

void main() {
  final noteService = NoteService();

  runApp(App(
    noteService: noteService,
  ));
}
