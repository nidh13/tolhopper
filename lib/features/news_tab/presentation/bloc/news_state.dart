part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class AllNewsSuccessLoaded extends NewsState {
  AllNewsSuccessLoaded({
    required this.news,
  });

  final List<NewsModel> news;

  @override
  List<Object?> get props => [news];
}

class SingleNewsSuccessLoaded extends NewsState {
  SingleNewsSuccessLoaded({
    required this.news,
  });

  final NewsModel news;

  @override
  List<Object?> get props => [news];
}

class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
