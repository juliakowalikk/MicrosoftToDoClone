import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microsoft_to_do/cubit/task_cubit.dart';
import 'package:microsoft_to_do/task.dart';

import 'home_page_list_view_container.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({super.key});

  @override
  State<HomePageListView> createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> {
  bool isTaskChecked = false;
  bool isStarChecked = false;
  bool isDoneTaskChecked = true;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
        final List<Task> tasks = context.read<TaskCubit>().tasks;
        final List<Task> deletedTasks = context.read<TaskCubit>().deletedTasks;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) => state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loaded: (tasks, deletedTasks) => HomePageListViewContainer(
                    checkBoxValue: isTaskChecked,
                    taskTitle: tasks[index].input,
                    checkBoxOnChanged: (bool? value) =>
                        context.read<TaskCubit>().removeTask(
                              tasks[index],
                            ),
                  ),
                ),
              ),
              Text(
                deletedTasks.isEmpty ? '' : 'Completed',
                style: const TextStyle(color: Colors.white),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: deletedTasks.length,
                itemBuilder: (context, index) {
                  final List<Task> deletedTasks =
                      context.read<TaskCubit>().deletedTasks;

                  return HomePageListViewContainer(
                    checkBoxValue: isDoneTaskChecked,
                    taskTitle: deletedTasks[index].input,
                    style:
                        const TextStyle(decoration: TextDecoration.lineThrough),
                    checkBoxOnChanged: (bool? value) =>
                        context.read<TaskCubit>().removeTaskFromCompleted(
                              deletedTasks[index],
                            ),
                  );
                },
              )
            ],
          ),
        );
      });
}
