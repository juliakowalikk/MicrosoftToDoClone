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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) => BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final List<Task> tasks = context.read<TaskCubit>().tasks;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) => state.maybeWhen(
              orElse: () => const SizedBox(),
              loaded: (tasks) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.grey,
                          value: isChecked,
                          onChanged: (bool? value) =>
                              setState(() => isChecked = value!),
                        ),
                        Text(tasks[index].input),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
