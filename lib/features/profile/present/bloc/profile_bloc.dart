import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/edit_profile_use_case.dart';
import 'profile_event.dart';
import 'profile_state.dart';
@LazySingleton()

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final EditProfileUseCase editProfileUseCase;
  ProfileBloc({
    required this.editProfileUseCase,
  }) : super(
          const ProfileState.initial(),
        ) {
    on<ProfileEvent>(
      (event, emit) async {
        await event.when(
          editProfile: (formData) async {
            emit(
              const ProfileState.loading(),
            );
            final result = await editProfileUseCase.editProfile(
              formData: formData,
            );
            await result.when(
              success: (response) async {
                UserSingleton.instance.user = response;
                emit(
                  const ProfileState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  ProfileState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
