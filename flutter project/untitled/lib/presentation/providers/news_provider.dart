import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../data/models/news_model.dart';
import '../../data/use_cases/news_use_case.dart';

class NewsProvider extends ChangeNotifier {
  final NewsUseCase _newsUseCase = NewsUseCase();
  List<NewsArticle> _news = [];

  List<NewsArticle> get news => _news;

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
