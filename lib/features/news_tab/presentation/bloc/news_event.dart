part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNewsEvent extends NewsEvent {
  final String locale;

  GetNewsEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}

class GetSpecificNewsEvent extends NewsEvent {
  final String locale;
  final int id;

  GetSpecificNewsEvent({
    required this.locale,
    required this.id,
  });

  @override
  List<Object?> get props => [id, locale];
}
