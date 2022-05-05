import 'package:http/http.dart' as http;
import 'package:flutter_assignment/models/photos.dart';

class PhotoService{
  static var client = http.Client();

  static Future<List<Photos>?> fetchPhotos()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return photosFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}