
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/providers/news_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsScreen(),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  final String apiKey = '85940a4d7b23488ba7ecd9e9e7c6533e';

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                newsProvider.fetchNews(apiKey, 'india');
              },
              child: Text('Fetch News'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                      ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: newsProvider.news.length,
                itemBuilder: (context, index) {
                  final article = newsProvider.news[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(article.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (article.author.isNotEmpty)
                            Text('Author: ${article.author}'),
                          if (article.imageUrl.isNotEmpty)
                            Image.network(article.imageUrl),
                          Text(article.description),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
