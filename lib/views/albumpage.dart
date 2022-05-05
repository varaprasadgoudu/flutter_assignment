import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/album_controller.dart';
import 'package:flutter_assignment/views/photospage.dart';
import 'package:get/get.dart';

class AlbumPage extends StatelessWidget {
  String? userId;
  AlbumPage({this.userId});
  AlbumController albumController = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    albumController.fetchAlbums();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Obx((){
          if(albumController.isLoading.value){
            return Center(child: CircularProgressIndicator());
          } else{
            print(userId);
            List<int> list =[];
            int i=0;
            for(i; i<albumController.albumList.length;i++){
              print(albumController.albumList[i].userId);
              if(userId==albumController.albumList[i].userId.toString()){
                list.add(i);
              }
            }
            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return Card(
                child: ListTile(
                  title: Text(albumController.albumList[list[index]].title!),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>PhotosPage(albumId: albumController.albumList[list[index]].id.toString(),))
                    );
                  },
                ),
              );
            },
                itemCount: list.length);
          }
        }
        ),
      ),
    );
  }
}
