import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/posts_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Posts extends StatelessWidget {
  String? userId;
  Posts({this.userId});
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    postController.fetchPosts();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Obx((){
          if(postController.isLoading.value){
            return Center(child: CircularProgressIndicator());
          } else{
            List<int> list =[];
            int i=0;
            for(i; i<postController.postList.length;i++){
              print(postController.postList[i].userId);
              if(userId==postController.postList[i].userId.toString()){
                list.add(i);
              }
            }

            return ListView.builder(itemBuilder: (BuildContext context, int index){
              List<String> list_comments =[];
              int j=0;
              for(j; j<postController.commetsList.length;j++){
                if(postController.postList[list[index]].id.toString()==postController.commetsList[j].postId.toString()){
                  list_comments.add(postController.commetsList[j].name!);
                }
              }
                return Card(
                  child: ExpansionTile(
                    title: Text(postController.postList[list[index]].title!),
                    children: [
                      Container(
                        height: 80,
                        child: ListView.builder(

                            itemCount: 3,
                            itemBuilder: (context,index){
                              print("list view comments"+list_comments.toString());
                            return Text("${index+1}: ${list_comments[index]}");
                        }),
                      )
                    ],
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
