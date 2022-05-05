import 'package:flutter_assignment/models/users.dart';
import 'package:http/http.dart' as http;

class UserService{
  static var client = http.Client();

  static Future<List<Users>?> fetchUsers()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return usersFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

}