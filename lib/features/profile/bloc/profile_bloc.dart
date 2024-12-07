import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileUser>(
      (event, emit) async {},
    );

    on<ChangeProfileImage>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        emit(ProfileLoading());
      },
    );
    on<UpdateProfile>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        emit(ProfileLoading());
      },
    );
    on<ChangePassword>(
      (event, emit) async {
        emit(ProfileLoading());
      },
    );
  }
}
