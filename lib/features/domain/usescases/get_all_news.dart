import 'package:dap_test/core/error/failure.dart';
import 'package:dap_test/core/usescases/usecase.dart';
import 'package:dap_test/features/domain/entity/all_news_entity.dart';
import 'package:dap_test/features/domain/repostiroy/all_news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAllNews extends UseCase<List<AllNewsEntity>, PageAllNewsParams>{
  final AllNewsRepository newsRepository;

  GetAllNews(this.newsRepository);

  @override
  Future<Either<Failure, List<AllNewsEntity>>> call (PageAllNewsParams params) async {
    return await newsRepository.getAllNews(params.page);
  }
}

class PageAllNewsParams extends Equatable {
  final int page;
  PageAllNewsParams({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}