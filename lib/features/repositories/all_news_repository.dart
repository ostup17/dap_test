import 'package:dap_test/core/error/exception.dart';
import 'package:dap_test/core/error/failure.dart';
import 'package:dap_test/core/platform/network_info.dart';
import 'package:dap_test/features/data/datasources/all_news_local_data_source.dart';
import 'package:dap_test/features/data/datasources/all_news_remote_data_source.dart';
import 'package:dap_test/features/domain/entity/all_news_entity.dart';
import 'package:dap_test/features/domain/repostiroy/all_news_repository.dart';
import 'package:dartz/dartz.dart';

class AllNewsRepositoryImpl implements AllNewsRepository {
  final AllNewsRemoteDataSource remoteDataSource;
  final AllNewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AllNewsRepositoryImpl({required this.networkInfo, required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<AllNewsEntity>>> getAllNews(int page) async {
    if(await networkInfo.isConnected) {
      try {
        final remoteAllNews = await remoteDataSource.getAllNews(page);
        localDataSource.allNewsToCache(remoteAllNews);
        return Right(remoteAllNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationAllNews = await localDataSource.getLastAllNewsFromCache();
        return Right(locationAllNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}