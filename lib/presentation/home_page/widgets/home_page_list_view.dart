import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microsoft_to_do/cubit/task_cubit.dart';
import 'package:microsoft_to_do/task.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({super.key});

  @override
  State<HomePageListView> createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> {
  bool isTaskChecked = false;
  bool isStarChecked = false;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
        final List<Task> tasks = context.read<TaskCubit>().tasks;
        final List<Task> deletedTasks = context.read<TaskCubit>().deletedTasks;
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) => state.maybeWhen(
                orElse: () => const SizedBox(),
                loaded: (tasks, deletedTasks) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                              shape: const CircleBorder(),
                              activeColor: Colors.grey,
                              value: isTaskChecked,
                              onChanged: (bool? value) =>
                                  context.read<TaskCubit>().removeTask(
                                        tasks[index],
                                      )
                              // setState(() => isTaskChecked = value!),
                              ),
                          Text(tasks[index].input),
                          const Spacer(),
                          IconButton(
                            onPressed: () =>
                                setState(() => isStarChecked = !isStarChecked),
                            icon: Icon(
                                isStarChecked ? Icons.star : Icons.star_border),
                          )
                        ],
                      ),
                    ),
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

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(deletedTasks[index].input),
                  ),
                );
              },
            )
          ],
        );
      });
}
