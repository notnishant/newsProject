import 'package:dio/dio.dart';

import '../models/news_model.dart';

class NewsApiProvider {
  final Dio _dio = Dio();

  Future<List<NewsArticle>> fetchNews(String apiKey, String query) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey',
      );

      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        return articles
            .map((article) => NewsArticle(
                  title: article['title'] ??
                      '', 
                  description: article['description'] ??
                      '',
                  imageUrl: article['urlToImage'] ??
                      '', 
                  author: article['author'] ?? 'Unknown Author',
                ))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error fetching news: $e');
      throw e; 
    }
  }
}
