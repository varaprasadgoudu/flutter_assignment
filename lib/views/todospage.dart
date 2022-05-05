import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/todo_controller.dart';

class TodosPage extends StatelessWidget {
  String? userId;
  TodosPage({this.userId});
  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    return Scaffold(
      body:Obx((){
      if(todoController.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      } else {
        List<int> list =[];
        int i=0;
        for(i; i<todoController.todoList.length;i++){
          print(todoController.todoList[i].userId);
          if(userId==todoController.todoList[i].userId.toString()){
            list.add(i);

          }
        }
        print(list);
        print(userId.toString());
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                color: todoController.todoList[list[index]].completed==true?Colors.green:Colors.grey,
                child: ListTile(
                  title: Text(todoController.todoList[list[index]].title!),
                ),
              );

        });
      }
      }),
    );
  }
}
