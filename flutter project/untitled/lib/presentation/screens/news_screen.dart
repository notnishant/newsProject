import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/providers/news_provider.dart';
import 'newsdetailscreen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = '85940a4d7b23488ba7ecd9e9e7c6533e';
  TextEditingController searchController = TextEditingController();
  String selectedCountryCode = 'us'; // Default country is the United States
  // late NewsApiProvider newsApiProvider; // Declare the variable

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchHeadlines(apiKey, 'india');
    // Provider.of<NewsProvider>(context, listen: false).getTotalResults;
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // color: Colors.green,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search_outlined),
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.3), fontSize: 20),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     selectedCountryCode = value!;
                      //     newsProvider.fetchNews(
                      //         apiKey, searchController.text);
                      //   });},
                      onEditingComplete: () {
                        newsProvider.fetchNews(apiKey, searchController.text);
                      },
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    // color: Colors.yellow,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: DropdownButton<String>(
                      // style: TextStyle(),
                      value: selectedCountryCode,
                      onChanged: (value) {
                        setState(() {
                          selectedCountryCode = value!;
                          newsProvider.fetchHeadlines(
                              apiKey, selectedCountryCode);
                          // log(newsApiProvider.totalResults.toString());
                        });
                      },

                      items: const [
                        DropdownMenuItem(
                          value: 'us',
                          child: Text('United States'),
                        ),
                        DropdownMenuItem(
                          value: 'UK',
                          child: Text('United Kingdom'),
                        ),
                        DropdownMenuItem(
                          value: 'india',
                          child: Text('India'),
                        ),
                        // Add more countries as needed
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.3),
              ),
              // SizedBox(height: 16.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width / 2,
              //       child: TextField(),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width / 2,
              //     ),
              //   ],
              // ),
              // SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: newsProvider.news.length,
                  itemBuilder: (context, index) {
                    final article = newsProvider.news[index];
                    // return Card(
                    //   margin: EdgeInsets.symmetric(vertical: 8.0),
                    //   child: ListTile(
                    //     title: Text(article.title),
                    //     subtitle: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         if (article.author.isNotEmpty)
                    //           Text('Author: ${article.author}'),
                    //         if (article.imageUrl.isNotEmpty)
                    //           Image.network(article.imageUrl),
                    //         // Text(article.description),
                    //       ],
                    //     ),
                    //   ),
                    // );

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailsScreen(article: article),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            // height: 400,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),

                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(247, 229, 240, 0.4),
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'By ${article.author}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child:
                                          Icon(Icons.bookmark_border_rounded),
                                    )
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    article.imageUrl,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
