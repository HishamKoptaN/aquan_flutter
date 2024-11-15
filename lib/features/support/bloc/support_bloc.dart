import 'dart:async';
import 'dart:io';
import 'package:aquan/features/support/controller/support_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';
import '../../dash/controller/dashboard_controller.dart';
import '../model/support_model.dart';
part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportController _controller = SupportController();
  final DashboardController _dashboardController = DashboardController();
  final BehaviorSubject<List<Message>> _messagesController =
      BehaviorSubject<List<Message>>();
  Timer? _timer;
  Stream<List<Message>> get messagesStream => _messagesController.stream;
  SupportBloc() : super(SupportInitial()) {
    _startFetchingMessages();
    on<GetChatMessages>(
      (event, emit) async {
        emit(
          MessagesLoading(),
        );
        try {
          Map<String, dynamic> user = await _dashboardController.loadUserData();
          final messages = await _controller.fetchData();
          emit(
            MessagesLoaded(
              user: user,
            ),
          );
          _messagesController.sink.add(
            messages,
          );
        } catch (error) {
          emit(
            SupportError(
              error: error.toString(),
            ),
          );
        }
      },
    );
    on<SendMessage>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.sendMessage(
          event.message,
        );
        if (data['status']) {
          emit(
            MessageSended(),
          );
        } else if (!data['status']) {
          emit(
            SupportError(
              error: data['error'],
            ),
          );
        }
      },
    );
    on<SendFile>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.sendFile(event.file);
        if (data['status']) {
          emit(
            MessageSended(),
          );
        } else if (!data['status']) {
          emit(
            SupportError(
              error: data['error'],
            ),
          );
        }
      },
    );
  }

  void _startFetchingMessages() {
    _timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        add(
          GetChatMessages(),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
