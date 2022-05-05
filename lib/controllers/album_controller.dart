import 'package:flutter_assignment/models/albums.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/services/album_service.dart';

class AlbumController extends GetxController{
  var albumList = <Albums>[].obs;
  var isLoading = true.obs;

  void fetchAlbums() async{
    try{
      var albums = await AlbumService.fetchAlbums();
      if(albums !=null){
        albumList.value=albums;
        print("posts loaded");
      }
    }finally{
      isLoading(false);
    }
  }
}