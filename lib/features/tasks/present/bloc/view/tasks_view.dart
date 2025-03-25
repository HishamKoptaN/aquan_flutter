import 'package:aquan/core/utils/styles.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:aquan/features/tasks/present/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/singletons/tasks_singleton.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart';
import '../../../../controll/view/widgets/section.dart';
import '../../../data/model/task.dart';
import '../tasks_event.dart';
import '../tasks_state.dart';
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
      body: SectionAvailabilityWidget(
        canBack: true,
        sectionId: 2,
        onAvailable: (
          section,
        ) {
          return BlocProvider<TasksBloc>(
            create: (context) => getIt<TasksBloc>()
              ..add(
                const TasksEvent.get(),
              ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: () {
                      return ListView.builder(
                        itemCount: TasksSingleton.instance.tasks!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Task task = TasksSingleton.instance.tasks![index];
                          if (TasksSingleton.instance.tasks!.isEmpty) {
                            return Center(
                              child: Text(
                                t.noTasks,
                                style: cartHeading,
                              ),
                            );
                          } else {
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
                                      task.name!,
                                      style: cartHeading,
                                    ),
                                    Gap(
                                      10.h,
                                    ),
                                    Text(
                                      task.description!,
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
                          }
                        },
                      );
                    },
                    orElse: () {
                      return CustomShimmerWidget();
                    },
                  );
                },
              ),
            ),
          );
        }, 
      ),
    );
  }
}
