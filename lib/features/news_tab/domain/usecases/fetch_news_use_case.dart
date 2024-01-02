import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/domain/repository/news_repository.dart';

class FetchNewsUseCase implements UseCase<List<NewsModel>, String> {
  final NewsRepository repository;

  const FetchNewsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NewsModel>>> call(String locale) async {
    return await repository.fetchNews(locale: locale);
  }
}
