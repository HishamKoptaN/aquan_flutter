import 'package:aquan/core/utils/styles.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:aquan/features/tasks/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/get_tasks_model.dart';
import 'task_details.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.tasks,
      showAppBar: true,
      body: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc()
          ..add(
            GetTasks(),
          ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TasksLoadedSuccessfully) {
                if (state.getTasksApiResModel.tasks.isEmpty) {
                  return Center(
                    child: Text(
                      t.noTasks,
                      style: cartHeading,
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Task task = state.getTasksApiResModel.tasks[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              task: task,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              task.name,
                              style: cartHeading,
                            ),
                            const Gap(10),
                            Text(
                              task.description,
                            ),
                            const Gap(10),
                            Container(
                              padding: const EdgeInsets.all(6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: size.width * 0.2,
                              child: Text(
                                t.details,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.getTasksApiResModel.tasks.length,
                );
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: ListView(
                  children: [
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
