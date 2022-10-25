import 'package:dap_test/features/domain/entity/all_news_entity.dart';

class AllNewsModel extends AllNewsEntity {
  AllNewsModel(
      {required author,
      required description,
      required publishedAt,
      required title,
      required urlToImage})
      : super(
            author: author,
            description: description,
            publishedAt: publishedAt,
            title: title,
            urlToImage: urlToImage);

  factory AllNewsModel.fromJson(Map<String, dynamic> json) {
    return AllNewsModel(
        author: json['author'],
        description: json['description'],
        publishedAt: DateTime.parse(json['publishedAt'] as String),
        title: json['title'],
        urlToImage: json['urlToImage']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'publishedAt': publishedAt,
      'title': title,
      'urlToImage': urlToImage
    };
  }
}
