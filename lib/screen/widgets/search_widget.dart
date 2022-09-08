import 'package:flutter/material.dart';

import '../../core/colors/constant_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 22,
          ),
          hintText: 'Search',
          prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25)
        ),
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}
