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

  factory AnimeModel.fromMap(Map<dynamic, dynamic> map) {
    return AnimeModel(
        date: DateTime.parse(map['date']),
        title: map['yoast_head_json']['og_title'] ,
        description: map['yoast_head_json']['og_description'],
        link: map['link']);
  }
}
