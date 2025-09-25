import 'package:notes_app/models/note_model.dart';

abstract class GetNotesState {}
class GetNotesInitial extends GetNotesState {}
class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> notes;

  GetNotesSuccess({required this.notes});
}
