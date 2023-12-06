// import 'dart:developer';
// import 'package:flutter/material.dart';
// import '../../data/api.dart';

// class NewsDisplayPage extends StatefulWidget {
//   const NewsDisplayPage({super.key});

//   @override
//   _NewsDisplayPageState createState() => _NewsDisplayPageState();
// }

// class _NewsDisplayPageState extends State<NewsDisplayPage> {
//   final NewsApiService newsApiService = NewsApiService(
//     apiKey: '85940a4d7b23488ba7ecd9e9e7c6533e',
//     baseUrl: 'https://newsapi.org/v2/top-headlines',
//   );
//   late Map<String, dynamic> data = {};
//   TextEditingController searchController = TextEditingController();
//   String selectedCountryCode = 'us'; // Default country is the United States

//   @override
//   void initState() {
//     super.initState();
//     fetchTopHeadlines();
//   }

//   Future<void> fetchTopHeadlines() async {
//     try {
//       final Map<String, dynamic> fetchedData = await newsApiService.fetchData(
//         'country=$selectedCountryCode',
//       );
//       setState(() {
//         data = fetchedData;
//       });
//     } catch (e) {
//       log('Error: $e');
//     }
//   }

//   Future<void> fetchData(String query) async {
//     try {
//       final Map<String, dynamic> fetchedData =
//           await newsApiService.fetchData(query);
//       setState(() {
//         data = fetchedData;
//       });
//     } catch (e) {
//       log('Error: $e');
//     }
//   }

//   void onSearchChanged(String query) {
//     if (query.isNotEmpty) {
//       fetchData(query);
//     } else {
//       // Handle empty query
//       log('Empty query');
//     }
//   }

//   void onCountryChanged(String? countryCode) {
//     if (countryCode != null) {
//       setState(() {
//         selectedCountryCode = countryCode;
//       });
//       fetchTopHeadlines();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Hello',
//                     style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 4,
//                             )),
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       const CircleAvatar(
//                         radius: 15,
//                         backgroundColor: Colors.black,
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Image.asset(
//                         'assets/equal.png',
//                         height: 30,
//                         width: 25,
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Divider(
//                 height: 40,
//                 thickness: 2,
//                 color: Colors.grey.withOpacity(0.3),
//               ),
//              Divider(
//                 thickness: 2,
//                 color: Colors.grey.withOpacity(0.3),
//               ),
//               const SizedBox(height: 16.0),
//               data.isNotEmpty
//                   ? (data['articles'] as List?)?.isEmpty ?? true
//                       ? const Text('No articles found.')
//                       : Expanded(
//                           child: ListView.builder(
//                             itemCount: data['articles'].length,
//                             itemBuilder: (context, index) {
//                               final article = data['articles'][index];
//                               return ListTile(
//                                 title: Text(article['title']),
//                                 subtitle: Text(article['description']),
//                               );
//                             },
//                           ),
//                         )
//                   : const CircularProgressIndicator(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: NewsDisplayPage(),
//   ));
// }
