import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/news_api_provider.dart';
import '../../presentation/providers/news_provider.dart';
import 'components/filtercomponent.dart';
import 'components/newscard.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = '42d9775fc5dd433a82479d52741c1278';

  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchHeadlines(apiKey, 'india');
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child:
            Consumer<NewsApiProvider>(builder: (context, newsApiProvider, _) {
          return CustomScrollView(
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
                              // const Icon(
                              //   Icons.menu_rounded,
                              //   size: 30,
                              // ),
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
                      //Search  logic and Component here
                      const FilterComponent(),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              // "32504",
                              // newsApiProvider.totalResults.toString(),
                              NewsApiProvider.totalResults.toString(),
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Padding(
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
              //News card list
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
          );
        }),
      ),
    );
  }
}
