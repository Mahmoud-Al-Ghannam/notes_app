import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/selectable_color_list_widget.dart';

import '../constants.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
import '../models/note_model.dart';
import 'custom_button_widget.dart';
import 'custom_text_form_field_widget.dart';

class EditNoteForm extends StatefulWidget {
  final NoteModel note;

  const EditNoteForm({super.key, required this.note});

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late NoteModel note;

  @override
  void initState() {
    super.initState();
    note = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 25),
          SelectableColorListWidget(
            colors: randomColors,
            initialSelectedIndex: randomColors.indexOf(note.color),
            onSelected: (index, color) {
              note.color = color;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormFieldWidget(
            label: "Title",
            controller: TextEditingController(text: note.title),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return "This field is required";
              }
              return null;
            },
            onChanged: (value) {
              note.title = value ?? "";
            },
          ),
          SizedBox(height: 16),
          CustomTextFormFieldWidget(
            label: "Content",
            controller: TextEditingController(text: note.content),
            minLines: 1,
            maxLines: 20,
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return "This field is required";
              }
              return null;
            },
            onChanged: (value) {
              note.content = value ?? "";
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
