
import 'package:flutter/widgets.dart';

class Task{
  final int? id;
  final String? title;
  final String? descripiton;
  Task({this.id, this.title,this.descripiton});

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'title': title,
      'descripiton':descripiton
    };
  }
}