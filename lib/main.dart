import 'package:flutter/material.dart';
import 'package:bloc_with_apis/features/posts/ui/posts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC with API\'s',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PostsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
