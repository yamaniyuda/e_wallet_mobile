import 'package:equatable/equatable.dart';

class TipEntity extends Equatable {
  late int? id;
  late String? title;
  late String? url;
  late String? thumbnail;

  TipEntity({
    this.id,
    this.thumbnail,
    this.title,
    this.url
  });

  @override
  List<Object?> get props => [
    id, title, url, thumbnail
  ];

  TipEntity copyWith({
    int? id,
    String? title,
    String? url,
    String? thumbnail
  }) {
    return TipEntity(
      thumbnail: thumbnail ?? this.thumbnail,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url
    );
  }
}