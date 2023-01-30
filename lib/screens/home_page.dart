import 'package:flutter/material.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:todo/screens/new_task_page.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/tile.dart';

class HomePage extends StatelessWidget {
  // final List<ToDoModel> list;
  final List<ToDoModel> list = [
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
    ToDoModel(status: true, text: "title", time: DateTime.now()),
  ];

  HomePage({
    super.key,
    // required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TO DO", style: title), centerTitle: true, elevation: 2),
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: Builder(builder: (context) {
        // Popup task editor screen
        return FloatingActionButton.small(child: const Icon(Icons.add), onPressed: () => showDialog(context: context, builder: (context) => AddNewToDo()));
      }),
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        // Showing all list
        child: ListView.builder(
          itemCount: list.length + 1,
          itemBuilder: (context, index) {
            // Put space at the end of the list
            if (index == list.length) {
              return const SizedBox(height: 100);
            }
            return CustomListTile(
              head: index.toString(),
              time:
                  "${timeConvert(dateTime: list[index].time)} ${list[index].time.day.toString().padLeft(2, '0')}/${list[index].time.month.toString().padLeft(2, '0')}/${list[index].time.year.toString().padLeft(4, '0')}",
            );
          },
        ),
      ),
    );
  }
}

// This convert time to 12 hour and add am/pm at the end
String timeConvert({required DateTime dateTime}) {
  String amOrPm;
  if (dateTime.hour < 12) {
    amOrPm = 'AM';
  } else {
    amOrPm = 'PM';
  }

  int hour12 = dateTime.hour % 12;
  hour12 = hour12 == 0 ? 12 : hour12;

  return '${hour12.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $amOrPm';
}
