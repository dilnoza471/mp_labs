class Note {
int? id;
String title;
String content;


Note({this.id, required this.title, required this.content});


Map<String, dynamic> toMap() {
final map = <String, dynamic>{
'title': title,
'content': content,
};
if (id != null) map['id'] = id;
return map;
}


factory Note.fromMap(Map<String, dynamic> map) => Note(
id: map['id'] as int?,
title: map['title'] as String,
content: map['content'] as String,
);
}