import 'package:dap_test/core/error/exception.dart';
import 'package:dap_test/features/data/models/all_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class AllNewsLocalDataSource {
  Future<List<AllNewsModel>> getLastAllNewsFromCache();
  Future<void> allNewsToCache(List<AllNewsModel> allNews);
}

const CACHED_ALL_NEWS = 'CACHED_ALL_NEWS';

class AllNewsLocalDataSourceImpl implements AllNewsLocalDataSource {
  final SharedPreferences sharedPreferences;
  AllNewsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> allNewsToCache(List<AllNewsModel> allNews) {
    final List<String> listJson = allNews.map((allNews) =>
        json.encode(allNews.toJson())).toList();

    sharedPreferences.setStringList(CACHED_ALL_NEWS, listJson);
    return Future.value(listJson);
  }

  @override
  Future<List<AllNewsModel>> getLastAllNewsFromCache() {
    final jsonList = sharedPreferences.getStringList(CACHED_ALL_NEWS);

    if(jsonList!.isNotEmpty) {
      return Future.value(jsonList.map((allNews) => AllNewsModel.fromJson(json.decode(allNews))).toList());
    } else {
      throw CacheException();
    }
  }

}