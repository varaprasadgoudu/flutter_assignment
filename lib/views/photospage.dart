import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/photo_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/models/photos.dart';

class PhotosPage extends StatelessWidget {
  String? albumId;
  PhotosPage({this.albumId});
  PhotoController photoController = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    photoController.fetchAlbums();
    return Scaffold(
      body:Obx((){
        if(photoController.isLoading.value){
          return const Center(child: CircularProgressIndicator());
        }else{
          List<int> list =[];
          int i=0;
          for(i; i<photoController.photoList.length;i++){
            if(albumId==photoController.photoList[i].albumId.toString()){
              list.add(i);

            }
          }
          print(list.toString());
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: list.length,
              itemBuilder: (context, index){
                  return GridTile(
                    child: Image.network(photoController.photoList[list[index]].url!),
                    footer: Text(photoController.photoList[list[index]].title!),
                  );
              });
        }
      })
    );
  }
}
