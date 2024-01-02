import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/domain/repository/news_repository.dart';

class GetSpecificNewsUseCase
    implements UseCase<NewsModel, GetSpecificNewsParam> {
  final NewsRepository repository;

  const GetSpecificNewsUseCase({required this.repository});

  @override
  Future<Either<Failure, NewsModel>> call(
      GetSpecificNewsParam getSpecificNewsParam) async {
    return await repository.getSpecificNews(
      id: getSpecificNewsParam.id,
      locale: getSpecificNewsParam.locale,
    );
  }
}

class GetSpecificNewsParam extends Equatable {
  final String locale;
  final int id;

  const GetSpecificNewsParam({required this.locale, required this.id});

  @override
  List<Object?> get props => [id];
}
