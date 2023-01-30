import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/data_management.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:todo/screens/new_task_page.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/buttons.dart';
import 'package:todo/widgets/popup_background.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  final DataManagement dataManagement = Get.find();

  CustomListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Change status
              dataManagement.editData(
                index: index,
                toDoModel: ToDoModel(
                  status: !dataManagement.box.values.elementAt(index).status,
                  text: dataManagement.box.values.elementAt(index).text,
                  time: dataManagement.box.values.elementAt(index).time,
                ),
              );
            },
            child: Container(
              width: boxConstraints.maxWidth,
              margin: const EdgeInsets.symmetric(horizontal: padding / 2, vertical: padding / 4),
              padding: const EdgeInsets.symmetric(horizontal: padding / 2, vertical: padding / 2),
              constraints: const BoxConstraints(minHeight: 60),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(dataManagement.box.values.elementAt(index).status ? 0.7 : 1),
                borderRadius: BorderRadius.circular(padding / 2),
                boxShadow: shadow,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Check Icon and Title
                  Row(
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: dataManagement.box.values.elementAt(index).status ? 1 : 0),
                        duration: duration,
                        builder: (context, value, child) => AnimatedContainer(
                          duration: duration,
                          width: !dataManagement.box.values.elementAt(index).status ? 0 : iconSize * 2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                Icon(Icons.check, size: iconSize, color: textColor, shadows: shadow),
                                SizedBox(width: padding / 2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Name
                      Expanded(child: Text(dataManagement.box.values.elementAt(index).text, style: head1)),
                    ],
                  ),
                  const SizedBox(height: padding / 3),
                  // Time
                  Text(
                    "${timeConvert(dateTime: dataManagement.box.values.elementAt(index).time)} ${dataManagement.box.values.elementAt(index).time.day.toString().padLeft(2, '0')}/${dataManagement.box.values.elementAt(index).time.month.toString().padLeft(2, '0')}/${dataManagement.box.values.elementAt(index).time.year.toString().padLeft(4, '0')}",
                    style: subTitle1,
                  ),
                ],
              ),
            ),
          ),
          // Edit buttons row
          Positioned(
            right: padding,
            bottom: padding / 2,
            child: Row(
              children: [
                // Edit task
                CustomIconButton(
                  icons: Icons.edit,
                  onTap: () => showDialog(context: context, builder: (context) => EditToDo(index: index)),
                ),
                // Delete task
                CustomIconButton(
                  icons: Icons.delete,
                  onTap: () {
                    // Showing delete confermation
                    return showDialog(
                      context: context,
                      builder: (context) => PopupBackground(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Do you really want to delete?", style: head1),
                            const SizedBox(height: padding / 2),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Yes
                                ElevatedButton(
                                    onPressed: () {
                                      dataManagement.editData(index: index);
                                      Get.back();
                                    },
                                    child: const Text("Yes")),
                                const SizedBox(width: padding / 2),
                                // No
                                ElevatedButton(onPressed: () => Get.back(), child: const Text("No")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      );
    });
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
