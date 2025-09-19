import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet_widget.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/widgets/note_widget.dart';

import 'edit_note_view.dart';

class NotesView extends StatelessWidget {
  static const String id = "NotesView";

  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add,size: 32,),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottomSheetWidget();
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(title: "Notes", icon: Icons.search),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: NoteWidget(
                      onTap: () {
                        print("hello world");
                        Navigator.of(context).pushNamed(EditNoteView.id);
                      },
                      note: NoteModel(
                        title: "This is a title",
                        content: "This is a content \n hello world \n hi",
                        createdAt: DateTime.now(),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
