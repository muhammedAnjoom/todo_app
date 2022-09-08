import 'package:flutter/material.dart';
import 'package:todo_app/domain/task/model/task.dart';

import 'package:todo_app/infrastructure/task%20helper/dataBase_helper.dart';

class ScreenTaskPage extends StatefulWidget {
  const ScreenTaskPage({Key? key, required this.task}) : super(key: key);
  final Task? task;

  @override
  State<ScreenTaskPage> createState() => _ScreenTaskPageState();
}

class _ScreenTaskPageState extends State<ScreenTaskPage> {
  DatatBaseHelper _dbHelper = DatatBaseHelper();
  String _taskTitle = "";
  FocusNode? _tittleFoucs;
  FocusNode? _descripitonFoucs;
  bool _contentVisbile = false;
  @override
  void initState() {
    if (widget.task != null) {
      _contentVisbile = true;
      _taskTitle = widget.task!.title!;
    }
    _tittleFoucs = FocusNode();
    _descripitonFoucs = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _tittleFoucs!.dispose();
    _descripitonFoucs!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.task!.id!);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _tittleFoucs,
                            controller: TextEditingController()
                              ..text = _taskTitle,
                            onSubmitted: (value) async {
                              int _taskId = 0;
                              if (value != '') {
                                if (widget.task == null) {
                                  Task _newTask = Task(title: value);
                                  _taskId =
                                      await _dbHelper.insertTask(_newTask);
                                  print("new task ");
                                  setState(() {
                                    _contentVisbile = true;
                                    _taskTitle = value;
                                  });
                                  print("new task is sumbited");
                                } else {
                                  _dbHelper.updateTaskTitle(_taskId, value);
                                  print("update in succssfully");
                                }
                              }
                              _tittleFoucs!.requestFocus();
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff211551)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _contentVisbile,
                    child: TextField(
                      focusNode: _descripitonFoucs,
                      onSubmitted: (value) async {
                        if (value.isNotEmpty) {
                          DatatBaseHelper _dbHelper = DatatBaseHelper();
                          Task _newTask = Task(descripiton: value);
                          await _dbHelper.insertTask(_newTask);
                          print('description sumbit');
                        }
                        _descripitonFoucs!.requestFocus();
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Descripiton for the task...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 24)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Visibility(
                visible: _contentVisbile,
                child: Positioned(
                  bottom: 24,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 238, 15, 15)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
