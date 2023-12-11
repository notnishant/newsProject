import 'package:flutter/material.dart';

import '../../../data/models/news_model.dart';
import 'newsdetailscreen.dart';

newscard(BuildContext context, NewsArticle article) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailsScreen(article: article),
        ),
      );
    },
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 229, 240, 0.4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'By ${article.author}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 5),
                  //   child: Icon(Icons.bookmark_border_rounded),
                  // ),
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
}
