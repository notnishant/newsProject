
import '../models/news_model.dart';
import '../repositories/news_repository.dart';

class NewsUseCase {
  final NewsRepository newsRepository = NewsRepository();

  Future<List<NewsArticle>> getNews(String apiKey, String query) async {
    return newsRepository.fetchNews(apiKey, query);
  }
}
