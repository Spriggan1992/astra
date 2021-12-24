import 'package:astra_app/domain/store/models/like.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_actor_event.dart';
part 'store_actor_state.dart';
part 'store_actor_bloc.freezed.dart';

/// Defines bloc for store screen.
@injectable
class StoreActorBloc extends Bloc<StoreActorEvent, StoreActorState> {
  StoreActorBloc() : super(StoreActorState.initial()) {
    on<StoreActorEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(state.copyWith(likes: e.likes, like: e.likes[1]));
        },
        likePackageSelected: (e) async {
          emit(state.copyWith(like: e.like));
        },
      );
    });
  }
}
