import 'package:http/http.dart' as http;
import 'package:flutter_assignment/models/albums.dart';

class AlbumService{
  static var client = http.Client();

  static Future<List<Albums>?> fetchAlbums()async{
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return albumsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}