import 'dart:convert';

import 'package:dap_test/core/error/exception.dart';
import 'package:dap_test/features/data/models/all_news_model.dart';
import 'package:http/http.dart' as http;
abstract class AllNewsRemoteDataSource {
  Future<List<AllNewsModel>> getAllNews(int page);
}

class AllNewsRemoteDataSourceImpl implements AllNewsRemoteDataSource {
  final http.Client client;
  AllNewsRemoteDataSourceImpl({required this.client});

  Future<List<AllNewsModel>> getAllNews(int page) async {
    final response = await client.get(
        Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&pageSize=1&page=$page&apiKey=e65ee0938a2a43ebb15923b48faed18d'),
      headers: {'Content-Type': 'application/json'}
    );
    if(response.statusCode == 200) {
      final allNews = json.decode(response.body);
      return (allNews['articles'] as List).map((allNews) => AllNewsModel.fromJson(allNews)).toList();
    } else {
      throw ServerException();
    }
  }
}