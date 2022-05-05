import 'package:flutter_assignment/models/comments.dart';
import 'package:flutter_assignment/models/posts.dart';
import 'package:flutter_assignment/services/posts_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  var postList = <Posts>[].obs;
  var commetsList = <Comments>[].obs;
  var isLoading = true.obs;

  void fetchPosts() async{
    try{
      var posts = await PostService.fetchPosts();
      var comments = await PostService.fetchComments();
      if(posts !=null && comments!=null){
        postList.value=posts;
        commetsList.value=comments;
      }
    }finally{
      isLoading(false);
    }
  }
}