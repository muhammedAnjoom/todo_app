import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, this.text, this.isDone}) : super(key: key);
  final String? text;
  final bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isDone == true
                  ? const Color(
                      0xff7346fe,
                    )
                  : Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: isDone == true
                  ? null
                  : Border.all(
                      color: const Color(0xff86829d),
                      width: 1.5,
                    ),
            ),
            child: const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            ),
          ),
          Text(
            text ?? "unnamed todo",
            style: TextStyle(
              color: isDone == true ? const Color(0xfff211551) : Colors.grey,
              fontSize: 16,
              fontWeight: isDone ==true ? FontWeight.bold:null,
            ),
          )
        ],
      ),
    );
  }
}
