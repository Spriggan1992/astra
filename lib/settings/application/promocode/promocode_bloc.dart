import 'package:astra_app/settings/domain/promocode/i_promocode_repository.dart';
import 'package:astra_app/settings/domain/promocode/promocode_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'promocode_event.dart';
part 'promocode_state.dart';
part 'promocode_bloc.freezed.dart';

@injectable
class PromocodeBloc extends Bloc<PromocodeEvent, PromocodeState> {
  final IPromocodeRepository _promocodeRepository;
  PromocodeBloc(this._promocodeRepository) : super(PromocodeState.initial()) {
    on<PromocodeEvent>((event, emit) async {
      await event.map(
        codeSubmitted: (e) async {
          if (state.textInputIsValid) {
            emit(state.copyWith(isLoading: true));
            final response = await _promocodeRepository
                .sendPromocode(PromocodeModel(code: state.promocode));
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
          final isValid = e.promocode.isNotEmpty;
          emit(state.copyWith(
            promocode: e.promocode,
            textInputIsValid: isValid,
          ));
        },
      );
    });
  }
}
