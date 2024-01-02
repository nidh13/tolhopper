import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>> fetchNews({required String locale});

  Future<Either<Failure, NewsModel>> getSpecificNews({
    required int id,
    required String locale,
  });
}
