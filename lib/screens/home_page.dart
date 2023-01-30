import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/data_management.dart';
import 'package:todo/screens/new_task_page.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/tile.dart';

class HomePage extends StatelessWidget {
  final DataManagement dataManagement = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TO DO", style: title), centerTitle: true, elevation: 2),
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: Builder(builder: (context) {
        // Popup task editor screen
        return FloatingActionButton.small(child: const Icon(Icons.add), onPressed: () => showDialog(context: context, builder: (context) => EditToDo()));
      }),
      body: GetBuilder<DataManagement>(
        builder: (_) {
          return dataManagement.box.values.isEmpty
              // Show empty message when there is no task
              ? const Center(
                  child: Text(
                  "Hurry!! No task to do.\nTake rest and enjoy yourself.",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: head1,
                ))
              // Showing task
              : FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  // Showing all list
                  child: ListView.builder(
                    itemCount: dataManagement.box.length + 1,
                    itemBuilder: (context, index) {
                      // Put space at the end of the list
                      if (index == dataManagement.box.values.length) {
                        return const SizedBox(height: 100);
                      }
                      return CustomListTile(
                        index: index,
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
