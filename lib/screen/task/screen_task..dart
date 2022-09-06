import 'package:flutter/material.dart';
import 'package:todo_app/screen/widget/todo_widget.dart';

class ScreenTaskPage extends StatelessWidget {
  const ScreenTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff211551)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Descripiton for the task...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TodoWidget(
                    text: "study",
                    isDone: true,
                  ),
                  TodoWidget(
                    text: "write a noval",
                    isDone: true,
                  ),
                  TodoWidget()
                ],
              ),
              Positioned(
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
                      onPressed: () {
                       
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
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