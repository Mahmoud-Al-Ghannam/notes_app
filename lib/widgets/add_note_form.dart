import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/selectable_color_list_widget.dart';

import '../constants.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/get_notes_cubit/get_notes_cubit.dart';
import 'custom_button_widget.dart';
import 'custom_text_form_field_widget.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  NoteModel note = NoteModel(
    title: "",
    content: "",
    createdAt: DateTime.now(),
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 25),
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
            maxLines: 10,
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
          SelectableColorListWidget(
            colors: randomColors,
            onSelected: (index, color) {
              note.color = color;
            },
          ),
          SizedBox(height: 16),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (BuildContext context, state) {
              return CustomButtonWidget(
                isLoading: state is AddNoteLoading,
                text: "Add",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    note.createdAt = DateTime.now();
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
