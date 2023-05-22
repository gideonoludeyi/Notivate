import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notivate/firebase/firebase_authentication_service.dart';
import 'package:notivate/inmemory/inmemory_note_service.dart';
import 'package:notivate/views/app.dart';

import './firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator("localhost", 9090);

  final authService = FirebaseAuthenticationService(FirebaseAuth.instance);

  runApp(App(
    authService: authService,
    noteService: InMemoryNoteService(),
  ));
}
