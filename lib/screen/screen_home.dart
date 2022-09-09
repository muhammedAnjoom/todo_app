import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screen/screen_todo_item.dart';
import 'package:todo_app/screen/widgets/custom_appBar.dart';

import '../core/colors/constant_colors.dart';
import 'widgets/search_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: const PreferredSize(
          child: CustomAppBar(),
          preferredSize: Size.fromHeight(70),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Stack(
            children: [
              const SearchBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: ValueListenableBuilder<Box<Todo>>(
                  valueListenable: Hive.box<Todo>("todo").listenable(),
                  builder: (context, todos, child) {
                    return ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos.getAt(index);
                        return TodoItem(
                          index: index,
                          task: todo!.task,
                          isDone: todo.isDone,
                          onTap: () => _toggleTodoState(index),
                          onDelete: () => _deleteTodo(index),
                        );
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        margin: const EdgeInsets.only(
                            bottom: 20, right: 20, left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _todoController,
                          decoration: const InputDecoration(
                              hintText: "Add  a new todo item",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // final _text = _todoController.text;
                          _addTodo();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tdBlue,
                            minimumSize: const Size(60, 60),
                            elevation: 10),
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _addTodo() async {
    if (_todoController.text.isEmpty) {
      return ;
    } else {
      final todo = Todo(task: _todoController.text, isDone: false);
      await Hive.box<Todo>("todo").add(todo);
      _todoController.text = "";
    }
  }

  Future<void> _deleteTodo(int index) async {
    await Hive.box<Todo>("todo").deleteAt(index);
  }

  Future<void> _toggleTodoState(int index) async {
    final todo = Hive.box<Todo>("todo").getAt(index);
    await Hive.box<Todo>("todo").putAt(
      index,
      Todo(task: todo!.task, isDone: !todo.isDone),
    );
  }
}
