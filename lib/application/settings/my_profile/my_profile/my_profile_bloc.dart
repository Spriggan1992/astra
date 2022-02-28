import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/services/i_cache_user_service.dart';
import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:astra_app/domain/store/models/wallet.dart';
import 'package:astra_app/domain/store/repositories/i_store_reposytory.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';
part 'my_profile_bloc.freezed.dart';

@injectable
class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final IStoreReposytory _storeRepository;
  final IProfileRepository _profileRepo;
  final ICacheUserService _userInfo;
  MyProfileBloc(this._profileRepo, this._storeRepository, this._userInfo)
      : super(const MyProfileState.initial()) {
    on<MyProfileEvent>((event, emit) async {
      await event.map(profileLoaded: (e) async {
        emit(const MyProfileState.loadInProgress());

        final profileResponse = await _profileRepo.getProfile();
        final curatorInfoResponse = await _profileRepo.getCuratorInfo();
        final walletResponse = await _storeRepository.getMyWallet();

        profileResponse.fold(
          (failure) => emit(MyProfileState.loadFailure(failure)),
          (profile) async {
            _userInfo.setUserProfile(profile);
            walletResponse.fold(
              (failure) => emit(
                MyProfileState.loadFailure(failure),
              ),
              (wallet) {
                curatorInfoResponse
                    .fold((failure) => MyProfileState.loadFailure(failure),
                        (curator) {
                  emit(MyProfileState.loadSuccess(profile, wallet, curator));
                });
              },
            );
          },
        );
      });
    });
  }
}
