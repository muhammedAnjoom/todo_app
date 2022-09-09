import 'package:flutter/material.dart';
import 'package:todo_app/core/colors/constant_colors.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatelessWidget {
  // final ToDo todo;
  final int index;
  final String task;
  final bool isDone;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  const TodoItem({
    Key? key, required this.index, required this.task, required this.isDone, this.onTap, this.onDelete,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(index.toString()),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            width: 8,
            style: BorderStyle.none,
          ),
        ),
        tileColor: Colors.white,
        leading: Icon(
          isDone  ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          task,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
