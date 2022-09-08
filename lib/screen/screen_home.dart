import 'package:flutter/material.dart';
import 'package:todo_app/screen/screen_todo_item.dart';
import 'package:todo_app/screen/widgets/custom_appBar.dart';

import '../core/colors/constant_colors.dart';
import 'widgets/search_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: const PreferredSize(
          child: CustomAppBar(),
          preferredSize: Size.fromHeight(70),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              SearchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        left: 10
                      ),
                      child:const  Text("All ToDos",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    TodoItem()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

