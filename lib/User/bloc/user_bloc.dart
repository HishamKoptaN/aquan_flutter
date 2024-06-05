import 'dart:io';

import 'package:aquan/Controllers/user_controller.dart';
import 'package:aquan/Models/currency.dart';
import 'package:aquan/Models/notification.dart';
import 'package:aquan/Models/transaction.dart';
import 'package:aquan/Models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController _controller = UserController();

  UserBloc() : super(UserInitial()) {
    on<GetReferals>((event, emit) async {
      Map<String, dynamic> data = await _controller.getReferals();

      if (data['status']) {
        emit(ReferalsDone(users: data['users'], user: data['user']));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<GetProfileUser>((event, emit) async {
      Map<String, dynamic> data = await _controller.getProfileUser();

      if (data['status']) {
        emit(ProfileDone(user: data['user']));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<ChangeProfile>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data = await _controller.changeProfileUser(
        event.name,
        event.address,
        event.phone,
      );

      if (data['status']) {
        emit(ProfileDone(user: data['user'], updated: true));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<ChangeAccountInfo>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data =
          await _controller.changeAccountInfo(event.accountInfo);

      if (data['status']) {
        emit(ProfileDone(user: data['user'], updated: true));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<ChangeProfileImage>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data =
          await _controller.changeProfilePicture(event.file);

      if (data['status']) {
        emit(ProfileDone(user: data['user'], updated: true));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<ChangePassword>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data = await _controller.changePasswordUser(
        event.currentPassword,
        event.newPassword,
        event.newPasswordConfirmation,
      );

      if (data['status']) {
        emit(ProfileDone(user: data['user'], updated: true));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<Dashboard>((event, emit) async {
      Map<String, dynamic> data = await _controller.getDashboard();

      if (data['status']) {
        List trs = data['transactions'];
        List currs = data['currencies'];

        User user = User.fromJson(data['user']);
        List<Transaction> transactions =
            trs.map((tr) => Transaction.fromJson(tr)).toList();
        List<Currency> currencies =
            currs.map((curr) => Currency.fromJson(curr)).toList();

        emit(DashboardLoaded(
            transactions: transactions, user: user, currencies: currencies));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<GetNameOfUserByAccount>((event, emit) async {
      emit(UserLoading());
      Map<String, dynamic> data =
          await _controller.getUserByAccount(event.accountId);

      if (data['status']) {
        emit(UserAccountLoaded(name: data['name']));
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<SendPaymentToOtherAccount>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data =
          await _controller.sendMoneyToAccount(event.accountId, event.amount);

      if (data['status']) {
        emit(AmountSent());
      } else {
        emit(UserError(message: data['error']));
      }
    });

    on<GetNotifications>((event, emit) async {
      emit(UserLoading());

      Map<String, dynamic> data = await _controller.getNotifications();

      if (data['status']) {
        List n = data['notifications'];

        List<NotificationModel> notifications = n
            .map(
              (notification) => NotificationModel.fromJson(notification),
            )
            .toList();

        emit(NotificationsLoaded(notifications: notifications));
      } else {
        emit(UserError(message: data['error']));
      }
    });
  }
}
