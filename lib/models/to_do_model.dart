import 'package:hive/hive.dart';
part 'to_do_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  bool status;
  @HiveField(1)
  String text;
  @HiveField(2)
  DateTime time;

  ToDoModel({
    required this.status,
    required this.text,
    required this.time,
  });
}
