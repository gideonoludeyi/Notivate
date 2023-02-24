import 'package:flutter/material.dart';

import 'views/screens/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notivate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Feed'),
      debugShowCheckedModeBanner: true,
    );
  }
}
