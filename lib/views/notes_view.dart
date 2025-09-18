import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_widget.dart';

class NotesView extends StatelessWidget {
  static const String id = "NotesView";

  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes", style: TextStyle(fontSize: 32))),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return NoteWidget(
            note: NoteModel(
              title: "This is a title",
              content: "This is a content \n hello world \n hi",
              createdAt: DateTime.now(),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      ),
    );
  }
}
