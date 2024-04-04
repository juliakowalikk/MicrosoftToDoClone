import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microsoft_to_do/cubit/task_cubit.dart';
import 'package:microsoft_to_do/presentation/home_page/widgets/task_details_modal_bottom_sheet.dart';
import 'package:microsoft_to_do/task.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  late TextEditingController taskController;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.grey.shade600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        width: 100,
                        child: TextField(
                          onSubmitted: (controllerText) {
                            context
                                .read<TaskCubit>()
                                .addTask(Task(input: controllerText));
                            taskController.clear();
                          },
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: 'Add a Task',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TaskDetailsShowModalBottomSheet(),
            ],
          ),
        ),
      );
}
