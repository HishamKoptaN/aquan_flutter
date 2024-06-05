import 'dart:io';

import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Models/Task.dart';
import 'package:aquan/Tasks/bloc/task_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:aquan/Layouts/app_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Container(
        padding: const EdgeInsets.all(8.00),
        child: BlocProvider<TaskBloc>(
          create: (context) => TaskBloc()
            ..add(
              GetTaskDetails(id: widget.task.id),
            ),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
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
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  if (widget.task.image != null)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.fromBorderSide(BorderSide(
                            color: Theme.of(context).primaryColor,
                          ))),
                      child: Image.network(widget.task.imageUrl!),
                    ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: (size.width * 0.45),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse(widget.task.link!);
                            if (!await launchUrl(url)) {
                              //   print()
                            }
                          },
                          child: Text(
                            t.link,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: (size.width * 0.45),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (file != null) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => context.read<TaskBloc>().add(
                                      SendProof(widget.task, image: file!),
                                    ),
                              );
                            }
                          },
                          child: Text(
                            t.submit,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state is TaskDone && state.message != null)
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
                        state.message!,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  if (state is TaskDone && state.completed)
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
                          color: white,
                        ),
                      ),
                    ),
                  if (state is TaskDone && !state.completed)
                    Column(
                      children: [
                        const Gap(10),
                        if (state.error != null)
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: danger,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              state.error!,
                              style: const TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                        const Gap(10),
                        Text(
                          t.uploadProof,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Gap(20),
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              File file = File(result.files.single.path!);

                              setState(() {
                                this.file = file;
                              });
                            }
                          },
                          child: Container(
                            width: size.width,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: black,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(FontAwesomeIcons.cloudArrowUp),
                                const Gap(20),
                                Text(t.chooseImage),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                      ],
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
