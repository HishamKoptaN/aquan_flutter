import 'dart:io';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/support/bloc/support_bloc.dart';
import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController _sc = ScrollController();

  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.grey,
    borderColor: Colors.grey,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static final styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: Colors.blue.shade200,
    borderColor: Colors.blue.shade200,
    borderWidth: 1,
    elevation: 4,
    margin: const BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.support,
      showAppBar: true,
      body: BlocProvider(
        create: (context) => SupportBloc()..add(GetChatMessages()),
        child: BlocConsumer<SupportBloc, SupportState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MessagesLoaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => _sc.jumpTo(_sc.position.maxScrollExtent),
              );
              messageController.clear();
              final int currentUserId = state.user['id'];
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          controller: _sc,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            bool isCurrentUser =
                                currentUserId == message.userId;
                            if (message.isFile == "yes") {
                              return Bubble(
                                style: isCurrentUser ? styleMe : styleSomebody,
                                child: SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: message.message.toString(),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              );
                            } else {
                              return Bubble(
                                style: isCurrentUser ? styleMe : styleSomebody,
                                child: Text(
                                  message.message.toString(),
                                  style: TextStyle(
                                    color: isCurrentUser
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    _buildInputArea(context, t),
                    const Gap(20),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context, AppLocalizations t) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Gap(5),
          IconButton(
            padding: const EdgeInsets.all(8.0),
            splashColor: Colors.amber,
            splashRadius: 30,
            icon: const Icon(
              FontAwesomeIcons.paperPlane,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              final message = messageController.text;
              if (message.isNotEmpty) {
                context.read<SupportBloc>().add(SendMessage(message: message));
                messageController.clear();
              }
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
                      controller: messageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: t.message,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(8.0),
                    splashColor: Colors.amber,
                    splashRadius: 30,
                    icon: const Icon(
                      FontAwesomeIcons.paperclip,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        context.read<SupportBloc>().add(SendFile(file: file));
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
    );
  }
}
