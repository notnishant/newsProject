import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class NewsApiProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  int _totalResults = 0;

  int get totalResults => _totalResults;

  Future<List<NewsArticle>> fetchNews(String apiKey, String query) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey',
      );

      if (response.statusCode == 200) {
        _totalResults = response.data['totalResults'];
        notifyListeners();
        print(totalResults.toString());

        final List<dynamic> articles = response.data['articles'];

        return articles
            .map((article) => NewsArticle(
                  title: article['title'] ?? '',
                  description: article['description'] ?? '',
                  imageUrl: article['urlToImage'] ?? '',
                  author: article['author'] ?? 'Unknown Author',
                  content: article['content'] ?? '',
                ))
            .toList();
      } else {
        throw Exception(
            'Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching news: $e');
      rethrow;
    }
  }

  Future<List<NewsArticle>> fetchHeadlines(
      String apiKey, String country) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/everything?&apiKey=$apiKey&country=$country',
      );
      if (response.statusCode == 200) {
        _totalResults = response.data['totalResults'];
        notifyListeners();
        print(totalResults.toString());
        final List<dynamic> articles = response.data['articles'];
        return articles
            .map((article) => NewsArticle(
                  title: article['title'] ?? '',
                  description: article['description'] ?? '',
                  imageUrl: article['urlToImage'] ?? '',
                  author: article['author'] ?? 'Unknown Author',
                  content: article['content'] ?? '',
                ))
            .toList();
      } else {
        throw Exception(
            'Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching news: $e');
      rethrow;
    }
  }
}
