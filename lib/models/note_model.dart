class NoteModel {
  final String title;
  final String content;
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
