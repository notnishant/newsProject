import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/providers/news_provider.dart';
import 'presentation/screens/news_screen.dart';

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
