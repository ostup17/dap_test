import 'package:dap_test/features/domain/entity/all_news_entity.dart';
import 'package:dap_test/features/presentation/all_news_cubit/all_news_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';
import '../../domain/usescases/get_all_news.dart';
const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class AllNewsListCubit extends Cubit<AllNewsState> {
  final GetAllNews getAllNews;
  AllNewsListCubit({required this.getAllNews}) : super (AllNewsEmpty());
  int page = 1;
  void loadAllNews() async {
    if(state is AllNewsLoading) return;

    final currentState = state;
    var oldAllNews = <AllNewsEntity>[];

    if(currentState is AllNewsLoaded) {
      oldAllNews = currentState.allNewsList;
    }

    emit(AllNewsLoading(oldAllNews, isFirstFetch: page == 1));

    final failureOrAllNews = await getAllNews(PageAllNewsParams(page: page));
    
    failureOrAllNews.fold((error) => AllNewsError(message: _errorMessage(error)), (news) {
      page++;
      final allNews = (state as AllNewsLoading).oldAllNews;
      allNews.addAll(news);
      emit(AllNewsLoaded(news));
    });
  }

  String _errorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}