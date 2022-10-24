import 'package:equatable/equatable.dart';

class AllNewsEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;

  AllNewsEntity({
    required this.author,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.urlToImage
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    author,
    description,
    publishedAt,
    title,
    urlToImage
  ];
}