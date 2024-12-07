import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendMsgForm extends StatefulWidget {
  SendMsgForm({
    super.key,
    required this.onPressed,
  });
  void Function()? onPressed;
  @override
  _SendMsgFormState createState() => _SendMsgFormState();
}

class _SendMsgFormState extends State<SendMsgForm> {
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: t.message,
                border: InputBorder.none,
              ),
            ),
          ),
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
              // final message = messageController.text;
              // if (message.isNotEmpty) {
              //   context.read<SupportBloc>().add(
              //         SendMessage(
              //           message: message,
              //         ),
              //       );
              //   messageController.clear();
              // }
            },
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
                File file = File(
                  result.files.single.path!,
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
