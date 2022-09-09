
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  @HiveType(typeId: 0, adapterName: "TodoAdapter")
  const factory Todo({
    @HiveField(0) required String task,
    @HiveField(1) required bool isDone,
  }) = _Todo;
}