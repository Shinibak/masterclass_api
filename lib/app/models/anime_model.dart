class AnimeModel {
  final DateTime date;
  final String title;
  final String description;
  final String link;

  const AnimeModel({
    required this.date,
    required this.title,
    required this.description,
    required this.link,
  });

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
        date: DateTime.parse(map['date']),
        title: map['og_title'],
        description: map['og_description'],
        link: map['link']);
  }
}
