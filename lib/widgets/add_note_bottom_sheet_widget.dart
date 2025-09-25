import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';

import '../cubits/get_notes_cubit/get_notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheetWidget extends StatelessWidget {
  const AddNoteBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (BuildContext context, Object? state) {
        if (state is AddNoteSuccess) {
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddNoteForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
