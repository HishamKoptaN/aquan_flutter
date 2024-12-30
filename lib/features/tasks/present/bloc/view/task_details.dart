import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/singletons/task_details_singleton.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../layouts/app_layout.dart';
import '../../../data/model/task.dart';
import '../../../data/model/task_details.dart';
import '../task_bloc.dart';
import '../tasks_event.dart';
import '../tasks_state.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
    required this.task,
  });
  final Task task;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  File? file;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.task,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(8.00),
        child: BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(
            getTasksUseCase: getIt(),
            getTaskDetailsUseCase: getIt(),
            proofTaskUseCase: getIt(),
          )..add(
              TasksEvent.getTaskDetails(
                taskId: widget.task.id!,
              ),
            ),
          child: BlocConsumer<TasksBloc, TasksState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  ToastNotifier().showSuccess(
                    context: context,
                    message: t.success,
                  );
                  Navigator.pop(context);
                },
                failure: (a) {
                  ToastNotifier().showError(
                    context: context,
                    message: t.error,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                taskDetailsloaded: () {
                  TaskDetails taskDetails =
                      TaskDetailsSingleton.instance.taskDetails!;

                  return ListView(
                    children: [
                      CustomText(
                        text: widget.task.name!,
                        textAlign: TextAlign.center,
                        color: Colors.black,
                        fontSize: 18.sp,
                        maxLines: 3,
                        fontWeight: null,
                      ),
                      Gap(10.h),
                      CustomText(
                        text: widget.task.description!,
                        textAlign: TextAlign.center,
                        color: Colors.black,
                        fontSize: 16.sp,
                        maxLines: 5,
                        fontWeight: null,
                      ),
                      Gap(5.h),
                      CustomText(
                        text: "${t.reward_value}: ${widget.task.amount}",
                        textAlign: TextAlign.start,
                        color: Colors.black,
                        fontSize: 10.sp,
                        maxLines: 3,
                        fontWeight: null,
                      ),
                      Gap(5.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const Border.fromBorderSide(
                            BorderSide(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        child: Image.network(
                          widget.task.image!,
                        ),
                      ),
                      Gap(10.h),
                      if (!taskDetails.completed!)
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: (size.width * 0.45),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(widget.task.link!);
                              if (!await launchUrl(url)) {}
                            },
                            child: CustomText(
                              text: widget.task.link!,
                              textAlign: TextAlign.center,
                              color: Colors.blue,
                              fontSize: 10.sp,
                              maxLines: 3,
                              fontWeight: null,
                            ),
                          ),
                        ),
                      if (taskDetails.completed!)
                        Container(
                          width: size.width,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: successColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            t.taskCompleted,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (!taskDetails.completed!)
                        Column(
                          children: [
                            const Gap(10),
                            Text(
                              t.uploadProof,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();
                                if (result != null) {
                                  File file = File(result.files.single.path!);
                                  setState(
                                    () {
                                      this.file = file;
                                    },
                                  );
                                }
                              },
                              child: Container(
                                width: size.width,
                                height: 130.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: file != null
                                    ? Image.file(
                                        file!,
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.cloudArrowUp,
                                          ),
                                          Text(t.chooseImage),
                                          Gap(
                                            10.h,
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            Gap(
                              10.h,
                            ),
                          ],
                        ),
                      if (!taskDetails.completed!)
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: (size.width * 0.45),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (file != null) {
                                FormData formData = FormData.fromMap(
                                  {
                                    'id': widget.task.id,
                                    'image': await MultipartFile.fromFile(
                                      file!.path,
                                      filename: 'transfer_image.jpg',
                                    ),
                                  },
                                );
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => context.read<TasksBloc>().add(
                                        TasksEvent.proofTask(
                                          formData: formData,
                                        ),
                                      ),
                                );
                              }
                            },
                            child: Text(
                              t.submit,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
                loading: () {
                  return const CustomShimmerWidget();
                },
                orElse: () {
                  return const CustomShimmerWidget();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
