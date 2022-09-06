import 'package:flutter/material.dart';

class ScreenTaskCard extends StatelessWidget {
  const ScreenTaskCard({Key? key,this.title,this.description}) : super(key: key);
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            title ?? "UnNamed Task",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description ?? "No descripiton",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
