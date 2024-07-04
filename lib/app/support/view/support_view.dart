import 'dart:io';

import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/support/bloc/support_bloc.dart';
import 'package:bubble/bubble.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool loading = false;

  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: secondary,
    borderColor: secondary,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static BubbleStyle styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: Colors.grey.shade200,
    borderColor: Colors.grey.shade200,
    borderWidth: 1,
    elevation: 4,
    margin: const BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );

  String message = "";

  final ScrollController _sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    // final Size size = MediaQuery.of(context).size;

    return AppLayout(
      route: t.support,
      showAppBar: false,
      body: BlocProvider(
        create: (context) => SupportBloc()..add(GetChatMessages()),
        child: BlocBuilder<SupportBloc, SupportState>(
          builder: (context, state) {
            if (state is MessagesLoaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => _sc.jumpTo(_sc.position.maxScrollExtent),
              );

              List<Widget> childs = [];

              state.messages.every((message) {
                List images = ['png', 'gif', 'svg', 'jpg', 'jpeg'];

                if (message.isFile == 'yes' &&
                    images.contains(message.fileType!.toLowerCase())) {
                  childs.add(
                    Bubble(
                      style: (state.user.id == message.user!.id)
                          ? styleMe
                          : styleSomebody,
                      margin: const BubbleEdges.only(bottom: 10),
                      padding: const BubbleEdges.all(10),
                      child: Image.network(
                        message.fileUrl!,
                      ),
                    ),
                  );
                  return true;
                }

                if (message.isFile == 'yes') {
                  childs.add(
                    Bubble(
                      style: (state.user.id == message.user!.id)
                          ? styleMe
                          : styleSomebody,
                      margin: const BubbleEdges.only(bottom: 10),
                      padding: const BubbleEdges.all(10),
                      child: Text(message.fileOriginalName!,
                          style: const TextStyle(
                            color: black,
                            fontSize: 20,
                          )),
                    ),
                  );
                  return true;
                }

                childs.add(
                  Bubble(
                    style: (state.user.id == message.user!.id)
                        ? styleMe
                        : styleSomebody,
                    margin: const BubbleEdges.only(bottom: 10),
                    padding: const BubbleEdges.all(10),
                    child: message.isFile == 'yes'
                        ? const Text('Is File')
                        : Text(
                            message.message!,
                            style: const TextStyle(
                              color: black,
                              fontSize: 20,
                            ),
                          ),
                  ),
                );
                return true;
              });

              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          controller: _sc,
                          children: childs,
                        ),
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Gap(5),
                          IconButton(
                            padding: const EdgeInsets.all(8.0),
                            splashColor: Theme.of(context).primaryColor,
                            splashRadius: 30,
                            icon: const Icon(
                              FontAwesomeIcons.paperPlane,
                              color: black,
                              size: 25,
                            ),
                            onPressed: () {
                              context.read<SupportBloc>().add(
                                    SendMessage(message: message),
                                  );

                              setState(() {
                                message = "";
                              });
                            },
                          ),
                          const Gap(5),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: t.message,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          message = value;
                                        });
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    splashColor: Theme.of(context).primaryColor,
                                    splashRadius: 30,
                                    icon: const Icon(
                                      FontAwesomeIcons.paperclip,
                                      color: black,
                                      size: 25,
                                    ),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        File file =
                                            File(result.files.single.path!);

                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          context.read<SupportBloc>().add(
                                                SendMessage(message: file),
                                              );

                                          setState(() {
                                            message = "";
                                          });
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
