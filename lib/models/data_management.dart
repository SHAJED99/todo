import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:get/get.dart';

class DataManagement extends GetxController {
  late Box<ToDoModel> box;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ToDoModelAdapter());
    box = await Hive.openBox<ToDoModel>("to_do_list");
  }

  void editData({int? index, ToDoModel? toDoModel}) {
    if (index == null && toDoModel != null) {
      // Adding new task
      box.add(toDoModel);
    } else if (index != null && toDoModel != null) {
      // Updating data
      box.putAt(index, toDoModel);
    } else if (index != null && toDoModel == null) {
      // Delete task
      box.deleteAt(index);
    }

    update();
  }
}
