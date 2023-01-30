import 'package:flutter/material.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:todo/style.dart';
import 'package:todo/widgets/popup_background.dart';
import 'package:todo/widgets/text_form_field.dart';

class AddNewToDo extends StatelessWidget {
  final ToDoModel? toDoModel;
  final GlobalKey<FormState> _formKey = GlobalKey();

  AddNewToDo({super.key, this.toDoModel});

  @override
  Widget build(BuildContext context) {
    return PopupBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(toDoModel == null ? "Add new task" : "Edit task", style: head1),
              const SizedBox(height: padding / 2),
              Material(
                color: Colors.transparent,
                child: CustomTextFormField(
                  hintText: toDoModel == null ? "Add new task" : toDoModel!.text,
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
                        _formKey.currentState!.validate();
                      },
                      child: const Text("Save")),
                  const SizedBox(width: padding / 2),
                  ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
