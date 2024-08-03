import 'dart:io';
import 'package:aquan/app/profile/model/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Auth/controller/user_controller.dart';
import '../controller/profile_controller.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserController userController = UserController();

  final ProfileController profileController = ProfileController();
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileUser>(
      (event, emit) async {
        Map<String, dynamic> data = await profileController.getProfileUser();
        if (data["status"]) {
          GetProfileUserApiResModel getProfileUserModel =
              GetProfileUserApiResModel.fromJson(data);
          emit(
            ProfileDone(user: getProfileUserModel.user!, updated: false),
          );
        } else {
          emit(
            ProfileError(
              message: data["error"],
            ),
          );
        }
      },
    );
    on<ChangeProfile>(
      (event, emit) async {
        emit(ProfileLoading());
        Map<String, dynamic> data = await profileController.updateProfileUser(
          event.name,
          event.address,
          event.phone,
        );
        GetProfileUserApiResModel getProfileUserModel =
            GetProfileUserApiResModel.fromJson(data);
        emit(
          ProfileDone(user: getProfileUserModel.user!, updated: false),
        );
        if (data['status']) {
          emit(
            ProfileDone(
              user: getProfileUserModel.user!,
              updated: true,
            ),
          );
        } else {
          emit(ProfileError(message: data['error']));
        }
      },
    );
    on<ChangeProfileImage>(
      (event, emit) async {
        emit(ProfileLoading());
        Map<String, dynamic> data =
            await userController.updateProfilePicture(event.file);

        if (data['status']) {
          GetProfileUserApiResModel getProfileUserModel =
              GetProfileUserApiResModel.fromJson(data);
          emit(
            ProfileDone(
              user: getProfileUserModel.user!,
              updated: true,
            ),
          );
        } else {
          emit(
            ProfileError(
              message: data['error'],
            ),
          );
        }
      },
    );

    on<ChangePassword>(
      (event, emit) async {
        emit(ProfileLoading());
        Map<String, dynamic> data = await userController.changePasswordUser(
          event.currentPassword,
          event.newPassword,
          event.newPasswordConfirmation,
        );
        if (data['status']) {
          emit(
            ProfileDone(user: data['user'], updated: true),
          );
        } else {
          emit(
            ProfileError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
