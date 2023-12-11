import 'dart:async';

import 'package:country_picker/country_picker.dart';
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
  final String apiKey = '42d9775fc5dd433a82479d52741c1278';
  var countrysel = 'Country';
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    // final newsApiProvider = Provider.of<NewsApiProvider>(context);
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
              if (_debounceTimer != null) {
                _debounceTimer!.cancel();
              }

              _debounceTimer = Timer(const Duration(milliseconds: 500), () {
                newsProvider.fetchNews(apiKey, value);
              });
            },
            onEditingComplete: () {
              if (_debounceTimer != null) {
                _debounceTimer!.cancel();
              }

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
          child: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: false,
                favorite: <String>[
                  'IN',
                  'US',
                  'GB',
                  'cn',
                  'jp',
                  'SE',
                ],
                onSelect: (Country country) {
                  print('Select country: ${country.displayName}');
                  setState(() {
                    newsProvider.fetchHeadlines(apiKey, country.name);
                    countrysel = country.name;
                  });
                },
                countryListTheme: CountryListThemeData(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF8C98A8).withOpacity(0.2),
                      ),
                    ),
                  ),
                  searchTextStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            },
            child: Text(
              countrysel,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.3),
                fontSize: 20,
              ),
            ),
          ),
        ),

        // SizedBox(
        //   width: MediaQuery.of(context).size.width / 2.5,
        //   child: DropdownButton<String>(
        //     value: selectedCountryCode,
        //     focusColor: Colors.transparent,
        //     underline: const SizedBox(),
        //     onChanged: (value) {
        //       setState(() {
        //         selectedCountryCode = value!;
        //         newsProvider.fetchHeadlines(apiKey, selectedCountryCode);
        //         // print(
        //         //     'Total Results after fetchNews: ${newsApiProvider.totalResults}');
        //       });
        //     },
        //     items: const [
        //       DropdownMenuItem(
        //         value: 'us',
        //         child: Text('United States'),
        //       ),
        //       DropdownMenuItem(
        //         value: 'uk',
        //         child: Text('United Kingdom'),
        //       ),
        //       DropdownMenuItem(
        //         value: 'india',
        //         child: Text('India'),
        //       ),
        //     ],
        //   ),

        // ),
      ],
    );
  }
}
