import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:aquan/features/support/present/bloc/support_bloc.dart';
import '../../../core/singletons/user_singleton.dart';
import '../../../core/widgets/custom_circular_progress.dart';
import '../../layouts/app_layout.dart';
import '../data/model/msg.dart';
import '../data/model/msg_send.dart';
import '../present/bloc/support_event.dart';
import '../present/bloc/support_state.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});
  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  final TextEditingController msgController = TextEditingController();
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
    margin: const BubbleEdges.only(
      top: 8,
      left: 50,
    ),
    alignment: Alignment.topRight,
  );
  String formatTimestamp(
    Timestamp timestamp,
  ) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat(
      'yyyy-MM-dd HH:mm',
    ).format(
      dateTime,
    );
  }

  Future<void> initializeChat(String userId) async {
    try {
      final chatRef =
          FirebaseFirestore.instance.collection('support').doc(userId);

      final chatSnapshot = await chatRef.get();
      if (!chatSnapshot.exists) {
        await chatRef.set(
          {
            'user_image': UserSingleton.instance.user!.image,
            'user_name': UserSingleton.instance.user!.firstName,
            'last_msg_timestamp': FieldValue.serverTimestamp(),
          },
        );
      }
    } catch (e) {}
  }

  void onChatPageOpened() async {
    final userId = UserSingleton.instance.user!.id.toString();
    await initializeChat(
      userId,
    );
  }

  @override
  void initState() {
    super.initState();
    onChatPageOpened();
  }

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    final Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.support,
      showAppBar: true,
      body: BlocProvider(
        create: (context) => SupportBloc(),
        child: BlocConsumer<SupportBloc, SupportState>(
          listener: (context, state) {},
          builder: (context, state) {
            MsgSend msgSend = const MsgSend();
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('support')
                          .doc(
                            UserSingleton.instance.user!.id.toString(),
                          )
                          .collection('msgs')
                          .orderBy(
                            'sent_at',
                            descending: false,
                          )
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CustomCircularProgress(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Error: ${snapshot.error}",
                            ),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              "Start chatting!",
                            ),
                          );
                        }
                        final msgs = snapshot.data!.docs.map(
                          (doc) {
                            final data = doc.data() as Map<String, dynamic>;
                            return Msg.fromJson(data);
                          },
                        ).toList();

                        return ListView.builder(
                          itemCount: msgs.length,
                          itemBuilder: (context, index) {
                            final msg = msgs[index];
                            bool isCurrentUser =
                                UserSingleton.instance.user!.id == msg.senderId;
                            if (msg.isFile!) {
                              return Bubble(
                                style: isCurrentUser ? styleMe : styleSomebody,
                                child: SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: msg.content!,
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
                                  msg.content.toString(),
                                  style: TextStyle(
                                    color: isCurrentUser
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
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
                            msgSend = msgSend.copyWith(
                              isFile: false,
                            );
                            msgSend = msgSend.copyWith(
                              senderId: UserSingleton.instance.user!.id,
                            );
                            msgSend = msgSend.copyWith(
                              sentAt: DateTime.now(),
                            );
                            context.read<SupportBloc>().add(
                                  SupportEvent.sendMsg(
                                    msgSend: msgSend,
                                  ),
                                );
                            msgController.clear();
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: msgController,
                            onChanged: (value) {
                              msgSend = msgSend.copyWith(
                                content: value,
                              );
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: t.message,
                            ),
                          ),
                        ),
                        // IconButton(
                        //   padding: const EdgeInsets.all(8.0),
                        //   splashColor: Colors.amber,
                        //   splashRadius: 30,
                        //   icon: const Icon(
                        //     FontAwesomeIcons.paperclip,
                        //     color: Colors.black,
                        //     size: 25,
                        //   ),
                        //   onPressed: () async {
                        //     final result =
                        //         await FilePicker.platform.pickFiles();
                        //     if (result != null) {
                        //       File file = File(
                        //         result.files.single.path!,
                        //       );
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
