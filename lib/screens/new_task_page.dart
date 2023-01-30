import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/data_management.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/popup_background.dart';
import 'package:todo/widgets/text_form_field.dart';

class EditToDo extends StatelessWidget {
  final int? index;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  final DataManagement dataManagement = Get.find();

  EditToDo({
    super.key,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return PopupBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(index == null ? "Add new task" : "Edit task", style: head1),
              const SizedBox(height: padding / 2),
              Material(
                color: Colors.transparent,
                child: CustomTextFormField(
                  textEditingController: textEditingController,
                  hintText: index == null ? "Add new task" : dataManagement.box.values.elementAt(index!).text,
                  maxLines: 6,
                  height: -1,
                  textAlignVertical: TextAlignVertical.top,
                  verticalPadding: padding / 2,
                  validator: (value) {
                    if (value!.isEmpty) return "Invalid task";
                  },
                ),
              ),
              const SizedBox(height: padding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        dataManagement.editData(
                          index: index,
                          toDoModel: ToDoModel(
                            status: false,
                            text: textEditingController.text,
                            time: DateTime.now(),
                          ),
                        );
                        Get.back();
                      },
                      child: const Text("Save")),
                  const SizedBox(width: padding / 2),
                  ElevatedButton(onPressed: () => Get.back(), child: const Text("Cancel")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
