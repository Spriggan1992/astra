import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/store/models/like.dart';
import 'package:astra_app/domain/store/repositories/i_store_reposytory.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_event.dart';
part 'store_state.dart';
part 'store_bloc.freezed.dart';

/// Defines bloc for store screen.
@injectable
class StoreBloc extends Bloc<StoreEvent, StoreState> {
  /// Store api repository.
  final IStoreReposytory _storeRepository;
  StoreBloc(this._storeRepository) : super(const StoreState.initial()) {
    on<StoreEvent>((event, emit) async {
      await event.map(initialized: (e) async {
        emit(const StoreState.loadInProgress());
        final response = await _storeRepository.getLikePackages();
        emit(
          response.fold(
            (failure) => StoreState.loadFailure(failure),
            (success) => StoreState.loadSuccess(success),
          ),
        );
      });
    });
  }
}
