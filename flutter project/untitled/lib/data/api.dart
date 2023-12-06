// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class NewsApiService {
//   final String apiKey;
//   final String baseUrl;

//   NewsApiService({required this.apiKey, required this.baseUrl});

//   Future<Map<String, dynamic>> fetchData(String query) async {
   
//     final response = await http.get(
//       Uri.parse('$baseUrl?q=$query&apiKey=$apiKey'),
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
