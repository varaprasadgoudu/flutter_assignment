import 'package:flutter_assignment/models/posts.dart';
import 'package:flutter_assignment/models/comments.dart';
import 'package:http/http.dart' as http;

class PostService{
  static var client = http.Client();

  static Future<List<Posts>?> fetchPosts()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }

  }
  static Future<List<Comments>?> fetchComments()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return commentsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

}