import 'dart:async';
import 'dart:developer';

import 'package:astra_app/domain/core/repositories/i_update_user_repository.dart';
import 'package:astra_app/domain/core/services/i_user_unfo_service.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

/// Represent [Cubit] for listen to update user profile information.
@injectable
class UserCubit extends Cubit<UserState> {
  final IUpdateUserRepository _updateUserService;
  final IProfileRepository _profileRepository;
  final IUserInfoService _userInfoService;
  StreamSubscription? _subscription;
  UserCubit(
      this._updateUserService, this._userInfoService, this._profileRepository)
      : super(UserState.initial());

  Future<void> subscribeToUpdateUser() async {
    final topics = await _updateUserService.getTopicks();
    topics.fold(
      (l) => l.map(
        api: (_) => emit(state.copyWith(isUnexpectedError: true)),
        noConnection: (_) => null,
      ),
      (subscriptionTopics) {
        _subscription = _updateUserService
            .subscribeToUserUpdate(subscriptionTopics.topics)
            .listen(
          (signal) async {
            signal.fold((l) async {
              emit(state.copyWith(isUnexpectedError: true));
              await Future.delayed(const Duration(milliseconds: 1000));
              emit(state.copyWith(isUnexpectedError: false));
            }, (r) async {
              log(_userInfoService.userProfile.toString(),
                  name: 'USER_UPDATED');
              final response = await _profileRepository.getProfile();
              response.fold(
                (l) => emit(state.copyWith(isUnexpectedError: true)),
                (profile) {
                  _userInfoService.setUserProfile(profile);
                },
              );
            });
          },
        );
        emit(state.copyWith(isUnexpectedError: false));
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription!.cancel();
    await _updateUserService.dispose();
    return super.close();
  }
}
