import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  void getNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    emit(GetNotesSuccess(notes: notesBox.values.toList()));
  }
}