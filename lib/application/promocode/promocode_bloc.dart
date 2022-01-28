import 'package:astra_app/domain/promocode/i_promocode_repository.dart';
import 'package:astra_app/domain/promocode/promocode_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'promocode_event.dart';
part 'promocode_state.dart';
part 'promocode_bloc.freezed.dart';

@injectable
class PromocodeBloc extends Bloc<PromocodeEvent, PromocodeState> {
  final IPromocodeRepository _promocodeReposytory;
  PromocodeBloc(this._promocodeReposytory) : super(PromocodeState.initial()) {
    on<PromocodeEvent>((event, emit) async {
      await event.map(
        codeSubmitted: (e) async {
          if (state.textInputIsVaslid) {
            emit(state.copyWith(isLoading: true));
            final response =
                await _promocodeReposytory.sendPromocode(state.promocode);
            emit(response.fold(
                (failure) => failure.map(
                    api: (_) => state.copyWith(isUnexpectedError: true),
                    noConnection: (_) =>
                        state.copyWith(isNoConnectionError: true),
                    isNotValid: (_) => state.copyWith(isNotValid: true),
                    notExist: (_) => state.copyWith(isNotExist: true)),
                (promocodeModel) => state.copyWith(
                    isSuccess: true, promocodeModel: promocodeModel)));
            emit(
              state.copyWith(
                isNoConnectionError: false,
                isUnexpectedError: false,
                isSuccess: false,
                isLoading: false,
                isNotValid: false,
              ),
            );
          }
        },
        promocodeChanged: (e) async {
          final isValid = e.promocode.length >= 14;
          emit(state.copyWith(
            promocode: e.promocode,
            textInputIsVaslid: isValid,
          ));
        },
      );
    });
  }
}