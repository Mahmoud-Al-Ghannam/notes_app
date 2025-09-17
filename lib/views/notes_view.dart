import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_widget.dart';

class NotesView extends StatelessWidget {
  static const String id = "NotesView";
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: Placeholder()
    );
  }
}
