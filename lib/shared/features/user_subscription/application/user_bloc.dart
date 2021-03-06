import 'dart:async';
import 'dart:developer';

import 'package:astra_app/core/domain/models/user_online_status.model.dart';
import 'package:astra_app/core/domain/repositories/i_update_user_repository.dart';
import 'package:astra_app/core/domain/services/i_cache_user_service.dart';
import 'package:astra_app/settings/my_profile/domain/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final IUpdateUserRepository _updateUserRepo;
  final IProfileRepository _profileRepository;
  final ICacheUserService _cacheUserService;
  StreamSubscription? _subscription;
  UserBloc(
    this._updateUserRepo,
    this._profileRepository,
    this._cacheUserService,
  ) : super(UserState.initial()) {
    on<UserEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            add(const UserEvent.userStatusOnlineUpdated(true));
            add(const UserEvent.userUpdatesWatched());
          },
          userUpdatesWatched: (e) async {
            final topics = await _updateUserRepo.getTopics();
            topics.fold(
              (failure) => failure.map(
                api: (_) => emit(
                  state.copyWith(isUnexpectedError: true),
                ),
                noConnection: (_) => null,
              ),
              (subscriptionTopics) {
                _subscription = null;
                _subscription = _updateUserRepo
                    .subscribeToUserUpdate(subscriptionTopics.topics)
                    .listen(
                  (signal) async {
                    signal.fold(
                      (l) async {
                        emit(state.copyWith(isUnexpectedError: true));
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        emit(state.copyWith(isUnexpectedError: false));
                      },
                      (r) async {
                        log(_cacheUserService.userProfile.toString(),
                            name: 'USER_UPDATED');
                        final response = await _profileRepository.getProfile();
                        response.fold(
                          (l) => emit(state.copyWith(isUnexpectedError: true)),
                          (profile) {
                            _cacheUserService.setUserProfile(profile);
                          },
                        );
                        add(const UserEvent.favoritesLoaded());
                      },
                    );
                  },
                );
                emit(state.copyWith(isUnexpectedError: false));
              },
            );
          },
          favoritesLoaded: (e) async {
            emit(state.copyWith(canUpdate: true));
            await Future.delayed(const Duration(milliseconds: 1000));
            emit(state.copyWith(canUpdate: false));
          },
          userStatusOnlineUpdated: (e) async {
            final response = await _updateUserRepo.updatedUserOnlineStatus(
                UserOnlineStatusModel(isOnline: e.isOnline));
            response.fold(
              (l) => emit(state.copyWith(isUnexpectedError: true)),
              (r) {
                log('Successfully send status', name: 'User online status');
                emit(state.copyWith(isOnline: r.isOnline));
              },
            );
          },
          userUpdatesUnsubscribed: (e) async {
            if (_subscription != null) {
              await _subscription?.cancel();
              await _updateUserRepo.dispose();
            }
          },
        );
      },
    );
  }
  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
