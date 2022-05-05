import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/user_controller.dart';
import 'package:flutter_assignment/models/users.dart';
import 'package:flutter_assignment/views/albumpage.dart';
import 'package:flutter_assignment/views/postpage.dart';
import 'package:flutter_assignment/views/todospage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Flutter Assignment"),
      ),
      body: Center(
        child: Obx((){
          if(userController.isLoading.value){
            return Center(child: CircularProgressIndicator());
          }else{

            return ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    margin: EdgeInsets.all(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text("${userController.userList[index].name}"),
                          subtitle: Text("Email: ${userController.userList[index].email}"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Posts(userId: (index+1).toString(),)),
                              );
                            },
                                child: Text("Posts")),
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AlbumPage(userId: (index+1).toString(),)),
                              );
                            },
                                child: Text("Albums")),
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TodosPage(userId: (index+1).toString(),)),
                              );
                            },
                                child: Text("To-Dos")),
                          ],
                        )
                      ],
                    ),
                  );
                }
            );
          }
        }
        ),
      ),
    );
  }
}
