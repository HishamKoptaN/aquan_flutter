import 'dart:io';
import 'package:aquan/features/support/controller/support_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../model/support_model.dart';
part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportController _controller = SupportController();
  final DashboardController _dashboardController = DashboardController();

  SupportBloc() : super(SupportInitial()) {
    on<GetFAQs>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.getQuestions();
        if (data['status']) {
          Map<String, dynamic> faqs = data['content'];
          emit(FAQsLoaded(faqs: faqs));
        } else {
          emit(SupportError(message: data['error']));
        }
      },
    );
    on<GetChatMessages>(
      (event, emit) async {
        emit(SupportLoading());
        try {
          Map<String, dynamic> data = await _controller.getChatMessages();
          Map<String, dynamic> user = await _dashboardController.loadUserData();
          GetSupportApiResModel getSupportApiResModel =
              GetSupportApiResModel.fromJson(data);
          if (data['status']) {
            emit(
              MessagesLoaded(
                messages: getSupportApiResModel.messages ?? [],
                user: user,
              ),
            );
          } else {
            emit(
              SupportError(
                message: data['error'] ?? 'Unknown error occurred',
              ),
            );
          }
        } catch (e) {
          emit(SupportError(message: e.toString()));
        }
      },
    );
    on<SendMessage>(
      (event, emit) async {
        Map<String, dynamic> data =
            await _controller.sendMessage(event.message);
        Map<String, dynamic> user = await _dashboardController.loadUserData();
        GetSupportApiResModel getSupportApiResModel =
            GetSupportApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            MessagesLoaded(
              messages: getSupportApiResModel.messages!,
              user: user,
            ),
          );
        } else if (!data['status']) {
          emit(
            SupportError(
              message: data['error'],
            ),
          );
        }
      },
    );
    on<SendFile>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.sendFile(event.file);
        Map<String, dynamic> user = await _dashboardController.loadUserData();
        GetSupportApiResModel getSupportApiResModel =
            GetSupportApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            MessagesLoaded(
              messages: getSupportApiResModel.messages!,
              user: user,
            ),
          );
        } else if (!data['status']) {
          emit(SupportError(message: data['error']));
        }
      },
    );
  }
}
