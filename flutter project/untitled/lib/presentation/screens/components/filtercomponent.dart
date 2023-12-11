import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/news_api_provider.dart';
import '../../providers/news_provider.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  TextEditingController searchController = TextEditingController();
  String selectedCountryCode = 'india';
  final String apiKey = '85940a4d7b23488ba7ecd9e9e7c6533e';

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final newsApiProvider = Provider.of<NewsApiProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search_outlined),
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.3),
                fontSize: 20,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              newsProvider.fetchNews(apiKey, value);
              print(
                  'Total Results after fetchNews: ${newsApiProvider.totalResults}');
            },
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
          width: MediaQuery.of(context).size.width / 2.5,
          child: DropdownButton<String>(
            value: selectedCountryCode,
            focusColor: Colors.transparent,
            underline: const SizedBox(),
            onChanged: (value) {
              setState(() {
                selectedCountryCode = value!;
                newsProvider.fetchHeadlines(apiKey, selectedCountryCode);
                print(
                    'Total Results after fetchNews: ${newsApiProvider.totalResults}');
              });
            },
            items: const [
              DropdownMenuItem(
                value: 'us',
                child: Text('United States'),
              ),
              DropdownMenuItem(
                value: 'uk',
                child: Text('United Kingdom'),
              ),
              DropdownMenuItem(
                value: 'india',
                child: Text('India'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
