import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microsoft_to_do/cubit/task_cubit.dart';
import 'package:microsoft_to_do/style/app_typography.dart';

import 'home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                size: 20,
                color: Colors.white,
                Icons.arrow_back_ios_sharp,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  color: Colors.white,
                  Icons.lightbulb_outline,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  color: Colors.white,
                  Icons.more_horiz_outlined,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            title: Text('Lists', style: AppTypography.style3),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('lib/images/background.jpg'),
                  ),
                ),
              ),
              const HomePageBody(),
            ],
          ),
        ),
      );
}
