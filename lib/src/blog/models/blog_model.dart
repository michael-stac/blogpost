class BlogModel {
  final String id;
   String title;
   String subTitle;
   String body;
  final DateTime dateCreated;

  BlogModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.body,
    required this.dateCreated,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"],
    body: json["body"],
    dateCreated: DateTime.parse(json["dateCreated"]),
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "body": body,
        "dateCreated": dateCreated.toIso8601String(),
      };

}