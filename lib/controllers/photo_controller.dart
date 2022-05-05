import 'package:get/get.dart';
import 'package:flutter_assignment/models/photos.dart';
import 'package:flutter_assignment/services/photo_service.dart';

class PhotoController extends GetxController{
  var photoList = <Photos>[].obs;
  var isLoading = true.obs;

  void fetchAlbums() async{
    try{
      var photos = await PhotoService.fetchPhotos();
      if(photos !=null){
        photoList.value=photos;
        print("posts loaded");
      }
    }finally{
      isLoading(false);
    }
  }
}