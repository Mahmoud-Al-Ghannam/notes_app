import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:provider/provider.dart';

import 'cubits/simple_bloc_observer.dart';
import 'models/note_model.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(ColorAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotesCubit(),
      child: MultiProvider(
        providers: [
          BlocProvider(create: (context) => AddNoteCubit(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Notes App',
          theme: ThemeData(brightness: Brightness.dark),
          routes: {
            NotesView.id : (context) => NotesView(),
            EditNoteView.id : (context) => EditNoteView()
          },
          initialRoute: NotesView.id,
        ),
      ),
    );
  }
}

