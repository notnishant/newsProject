import 'package:flutter/material.dart';
import '../../data/models/news_model.dart';
import '../../data/use_cases/news_use_case.dart';

class NewsProvider extends ChangeNotifier {
  final NewsUseCase _newsUseCase = NewsUseCase();
  List<NewsArticle> _news = [];
  late int totalResults;
  List<NewsArticle> get news => _news;

  int get getTotalResults {
    if (totalResults == 0) {
      // You might want to throw an error or handle this situation differently
      throw Exception('totalResults not initialized');
    }
    return totalResults;
  }

  Future<void> fetchNews(String apiKey, String query) async {
    print('Fetching news...');
    _news = await _newsUseCase.getNews(apiKey, query);
    notifyListeners();
  }

  Future<void> fetchHeadlines(String apiKey, String country) async {
    print('Fetching news...');
    _news = await _newsUseCase.getHeadlines(apiKey, country);
    notifyListeners();
  }
}
