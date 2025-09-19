import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        NotesView.id : (context) => NotesView(),
        EditNoteView.id : (context) => EditNoteView()
      },
      initialRoute: NotesView.id,
    );
  }
}

