import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/domain/usecases/fetch_news_use_case.dart';
import 'package:tollhopper/features/news_tab/domain/usecases/get_specific_news_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(
      {required FetchNewsUseCase allNewsUseCase,
      required GetSpecificNewsUseCase singleNewsUseCase})
      : _fetchNewsUseCase = allNewsUseCase,
        _getSpecificNewsUseCase = singleNewsUseCase,
        super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      emit(NewsLoading());
    });
    on<GetNewsEvent>(_getNews);
    on<GetSpecificNewsEvent>(_getSpecificNews);
  }

  final FetchNewsUseCase _fetchNewsUseCase;
  final GetSpecificNewsUseCase _getSpecificNewsUseCase;

  // ------------------------------------------------------------------------
  Future<void> _getNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    final result = await _fetchNewsUseCase(event.locale);

    result.fold(
      (failure) {
        emit(NewsErrorState(message: mapFailureToMessage(failure)));
      },
      (success) {
        emit(AllNewsSuccessLoaded(news: success));
      },
    );
  }

  // ------------------------------------------------------------------------
  Future<void> _getSpecificNews(
      GetSpecificNewsEvent event, Emitter<NewsState> emit) async {
    final result = await _getSpecificNewsUseCase.call(
      GetSpecificNewsParam(
        locale: event.locale,
        id: event.id,
      ),
    );

    result.fold(
      (failure) {
        emit(NewsErrorState(message: mapFailureToMessage(failure)));
      },
      (success) {
        emit(SingleNewsSuccessLoaded(news: success));
      },
    );
  }
}
