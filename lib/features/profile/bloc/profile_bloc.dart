import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/profile_controller.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileController profileController = ProfileController();
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileUser>(
      (event, emit) async {
        Map<String, dynamic> data =
            await profileController.loadUserProfileLocalData();
        emit(
          ProfileDone(
            data: data,
          ),
        );
      },
    );

    on<ChangeProfileImage>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        emit(ProfileLoading());
        Map<String, dynamic> data =
            await profileController.updateProfilePicture(
          file: event.file,
        );
        if (data['status']) {
          prefs.setString(
            'user',
            json.encode(
              data['user'],
            ),
          );
          emit(
            ProfileDone(
              data: data,
            ),
          );
        } else if (!data['status']) {
          emit(
            ProfileError(
              message: data['error'],
            ),
          );
        }
      },
    );
    on<UpdateProfile>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        emit(ProfileLoading());
        Map<String, dynamic> data = await profileController.updateProfileUser(
          event.name,
          event.address,
          event.phone,
        );
        if (data['status']) {
          prefs.setString(
            'user',
            json.encode(
              data['user'],
            ),
          );
          emit(
            ProfileUpdatedSuccessfully(),
          );
        } else if (!data['status']) {
          emit(ProfileError(message: data['error']));
        }
      },
    );
    on<ChangePassword>(
      (event, emit) async {
        emit(ProfileLoading());
        Map<String, dynamic> data = await profileController.changePasswordUser(
          event.currentPassword,
          event.newPassword,
          event.newPasswordConfirmation,
        );
        if (data['status']) {
          emit(
            ProfileDone(data: data['user']),
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
