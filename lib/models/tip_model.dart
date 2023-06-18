class TipModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  const TipModel({
    this.thumbnail,
    this.id,
    this.title,
    this.url
  });

  factory TipModel.fromJson(Map<String, dynamic> json) {
    return TipModel(
      id: json["id"],
      thumbnail: json["thumbnail"],
      title: json["title"],
      url: json["url"]
    );
  }
}