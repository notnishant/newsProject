// news_details_screen.dart
import 'package:flutter/material.dart';
import '../../../data/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (article.imageUrl != '' || article.title != '')
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    color: Colors.blue,
                  ),
                  child: Hero(
                    tag: 'news_image_${article.title}',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          // top: Radius.circular(20),

                          ),
                      child: article.imageUrl != ''
                          ? AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                article.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (article.author.isNotEmpty)
                      Text(
                        'Author: ${article.author}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (article.description != '')
                            const Text(
                              'Description:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (article.description != '')
                            Text(
                              article.description,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (article.content != '')
                      const Text(
                        'Content:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    const SizedBox(height: 8),
                    if (article.content != '')
                      Text(
                        article.content,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
