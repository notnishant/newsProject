import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/screens/news_screen.dart';
import 'presentation/providers/news_provider.dart';
import 'data/providers/news_api_provider.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => NewsApiProvider()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsScreen(),
      ),
    );
  }
}
