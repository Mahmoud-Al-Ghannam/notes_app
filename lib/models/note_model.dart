import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final DateTime createdAt;

  NoteModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  NoteModel copyWith({String? title, String? content, DateTime? createdAt}) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
