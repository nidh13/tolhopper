import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String id;
  final String image;
  final String date;
  final String publishedAt;
  final String title;
  final String description;

  const NewsEntity({
    required this.id,
    required this.image,
    required this.date,
    required this.publishedAt,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id];
}
