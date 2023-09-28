import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_with_apis/features/posts/models/post.dart';

class PostsRepo {
  static Future<List<Post>> fetchPosts() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    List<Post> posts = [];
    try {
      final response = await http.get(url);
      final resData = json.decode(response.body);
      for (Map<String, dynamic> i in resData) {
        posts.add(Post.fromJson(i));
      }
      return posts;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> addPost() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    try {
      final response = await http.post(
        url,
        body: {
          "title": "Usama Irshad",
          "body": "Usama Irshad is a Computer Science Student",
          "userId": "18",
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
