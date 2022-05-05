import 'package:http/http.dart' as http;
import 'package:flutter_assignment/models/todos.dart';

class TodoService{
  static var client = http.Client();

  static Future<List<Todos>?> fetchTodos()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return todosFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}