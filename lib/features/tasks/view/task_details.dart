import 'dart:io';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/features/tasks/bloc/task_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Helpers/snack_bar.dart';
import '../model/get_tasks_model.dart';

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
        child: BlocProvider<TaskBloc>(
          create: (context) => TaskBloc()
            ..add(
              GetTaskDetails(
                id: widget.task.id,
              ),
            ),
          child: BlocConsumer<TaskBloc, TaskState>(
            listener: (context, state) {
              if (state is ApproveSendSuccessfully) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: true,
                      message: 'Approve send successfully',
                    ),
                  );
                context.read<TaskBloc>().add(
                      GetTaskDetails(
                        id: widget.task.id,
                      ),
                    );
              }
            },
            builder: (context, state) {
              if (state is TaskDetailsLoadedSuccessfully) {
                return ListView(
                  children: [
                    Text(
                      widget.task.name,
                      style: cartHeading,
                    ),
                    const Gap(20),
                    Text(
                      widget.task.description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: const Border.fromBorderSide(
                          BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      child: Image.network(
                        widget.task.image,
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!state.getTaskDetailsApiResModel.completed)
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: (size.width * 0.45),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final Uri url = Uri.parse(widget.task.link);
                                if (!await launchUrl(url)) {}
                              },
                              child: Text(
                                t.link,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        const Gap(10),
                        if (!state.getTaskDetailsApiResModel.completed)
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: (size.width * 0.45),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                if (file != null) {
                                  WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => context.read<TaskBloc>().add(
                                          SendProof(
                                            taskId: widget.task.id,
                                            image: file!,
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
                    ),
                    if (state.getTaskDetailsApiResModel.completed)
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
                    if (!state.getTaskDetailsApiResModel.completed)
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
                                        const Gap(20),
                                      ],
                                    ),
                            ),
                          ),
                          const Gap(10),
                        ],
                      )
                  ],
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
