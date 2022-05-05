import 'package:get/get.dart';
import 'package:flutter_assignment/models/todos.dart';
import 'package:flutter_assignment/services/todo_service.dart';

class TodoController extends GetxController{
  var todoList = <Todos>[].obs;
  var isLoading = true.obs;

  void fetchTodos() async{
    try{
      var todos = await TodoService.fetchTodos();
      if(todos !=null){
        todoList.value=todos;
      }
    }finally{
      isLoading(false);
    }
  }
}