import 'package:aquan/app/support/controller/support_controller.dart';
import 'package:aquan/Models/message.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportController _controller = SupportController();

  SupportBloc() : super(SupportInitial()) {
    on<GetFAQs>((event, emit) async {
      Map<String, dynamic> data = await _controller.getQuestions();

      if (data['status']) {
        Map<String, dynamic> faqs = data['content'];

        emit(FAQsLoaded(faqs: faqs));
      } else {
        emit(SupportError(message: data['error']));
      }
    });

    on<GetChatMessages>((event, emit) async {
      Map<String, dynamic> data = await _controller.getChatMessages();

      if (data['status']) {
        List msgs = data['messages'];
        Map<String, dynamic> u = data['user'];

        List<Message> messages = msgs
            .map(
              (message) => Message.fromJson(message),
            )
            .toList();
        User user = User.fromJson(u);

        emit(MessagesLoaded(messages: messages, user: user));
      } else {
        emit(SupportError(message: data['error']));
      }
    });

    on<SendMessage>((event, emit) async {
      Map<String, dynamic> data = await _controller.sendMessage(event.message);

      if (data['status']) {
        List msgs = data['messages'];
        Map<String, dynamic> u = data['user'];

        List<Message> messages = msgs.map(
          (message) {
            return Message.fromJson(message);
          },
        ).toList();
        User user = User.fromJson(u);

        emit(MessagesLoaded(messages: messages, user: user));
      } else {
        emit(SupportError(message: data['error']));
      }
    });
  }
}
