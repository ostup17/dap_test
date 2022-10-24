import 'package:dap_test/features/domain/entity/all_news_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class AllNewsRepository {
  Future<Either<Failure, List<AllNewsEntity>>> getAllNews(int page);
}