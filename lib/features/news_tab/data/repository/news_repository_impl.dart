import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/features/news_tab/data/data_sources/news_remote_data_source.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkInfo networkInfo;
  final NewsDataSource newsDataSource;

  const NewsRepositoryImpl({
    required this.networkInfo,
    required this.newsDataSource,
  });

  @override
  Future<Either<Failure, List<NewsModel>>> fetchNews({
    required String locale,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final list = await newsDataSource.getAllNews(locale: locale);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NewsModel>> getSpecificNews({
    required int id,
    required String locale,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final news = await newsDataSource.getSpecificNews(id: id, locale: locale);
      return Right(news);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
