class NewsArticle {
  final String title;
  final String description;
  final String author;
  final String imageUrl;
  final String content;

  NewsArticle(
      {required this.title,
      required this.description,
      required this.author,
      required this.imageUrl,
      required this.content});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
