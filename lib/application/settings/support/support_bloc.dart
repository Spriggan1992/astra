import 'package:astra_app/domain/profile/models/curator_model.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'support_event.dart';
part 'support_state.dart';
part 'support_bloc.freezed.dart';

@injectable
class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final IProfileRepository _profileRepository;
  SupportBloc(this._profileRepository) : super(const SupportState.initial()) {
    on<SupportEvent>((event, emit) async {
      await event.map(supportLoaded: (e) async {
        final response = await _profileRepository.getCuratorInfo();
        emit(response.fold(
            (failure) => failure.map(
                api: (_) => const SupportState.loadFailure(),
                noConnection: (_) => const SupportState.loadFailure()),
            (curatorInfo) => SupportState.loadSuccess(curatorInfo)));
      });
    });
  }
}