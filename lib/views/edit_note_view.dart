import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_form_field_widget.dart';
import 'package:notes_app/widgets/edit_note_form.dart';
import 'package:notes_app/widgets/selectable_color_list_widget.dart';

import '../widgets/custom_app_bar_widget.dart';

class EditNoteView extends StatefulWidget {
  static const String id = "EditNoteView";
  final NoteModel note;

  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late NoteModel note;

  @override
  void initState() {
    super.initState();
    note = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(
              title: "Edit",
              icon: Icons.arrow_back,
              onIconTap: () {
                BlocProvider.of<GetNotesCubit>(context).getNotes();
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(child: EditNoteForm(note: note)),
            ),
          ],
        ),
      ),
    );
  }
}
