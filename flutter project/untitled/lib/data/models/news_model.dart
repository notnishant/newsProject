class NewsArticle {
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.author,
    required this.imageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
