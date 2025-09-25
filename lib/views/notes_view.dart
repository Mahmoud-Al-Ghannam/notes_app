import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet_widget.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/widgets/note_widget.dart';

import 'edit_note_view.dart';

class NotesView extends StatefulWidget {
  static const String id = "NotesView";

  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNotesCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        var notes = state is GetNotesSuccess ? state.notes : [];
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.add, size: 32),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
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
                CustomAppBarWidget(title: "Notes"),
                SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: NoteWidget(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return EditNoteView(note: notes[index]);
                            }));
                          },
                          onDeleteIconTap: () {
                            notes[index].delete();
                            BlocProvider.of<GetNotesCubit>(context).getNotes();
                          },
                          note: notes[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
