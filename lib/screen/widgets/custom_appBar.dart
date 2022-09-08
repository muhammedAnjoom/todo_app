import 'package:flutter/material.dart';
import 'package:todo_app/core/colors/constant_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const[
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/log.png'),
            ),
          ),
        ],
      ),
    );
  }
}
