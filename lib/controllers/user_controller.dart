import 'package:flutter_assignment/models/users.dart';
import 'package:flutter_assignment/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  var userList = <Users>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async{
    try{
      isLoading(true);
      var users = await UserService.fetchUsers();
      if(users !=null){
        userList.value=users;
      }
    }finally{
      isLoading(false);
    }
  }
}