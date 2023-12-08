import '../models/news_model.dart';
import '../repositories/news_repository.dart';

class NewsUseCase {
  final NewsRepository newsRepository = NewsRepository();

  Future<List<NewsArticle>> getNews(String apiKey, String query)  {
    return  newsRepository.fetchNews(apiKey, query);
  }

  Future<List<NewsArticle>> getHeadlines(String apiKey, String country)  {
    return  newsRepository.fetchNews(apiKey, country);
  }
}
