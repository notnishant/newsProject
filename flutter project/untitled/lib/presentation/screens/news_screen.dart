import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/news_api_provider.dart';
import '../../presentation/providers/news_provider.dart';
import 'components/filtercomponent.dart';
import 'components/newscard.dart';
import 'newsdetailscreen.dart';
import 'package:untitled/data/models/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = '85940a4d7b23488ba7ecd9e9e7c6533e';

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchHeadlines(apiKey, 'india');
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/equal.png',
                            height: 30,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const FilterComponent(),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          // "32504",
                          Provider.of<NewsApiProvider>(context, listen: false)
                              .totalResults
                              .toString(),
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "articles",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final article = newsProvider.news[index];
                return newscard(context, article);
              },
              childCount: newsProvider.news.length,
            ),
          ),
        ],
      ),
    );
  }
}
