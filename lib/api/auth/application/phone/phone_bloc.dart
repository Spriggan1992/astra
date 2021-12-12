import 'package:astra_app/api/auth/infrastructure/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'phone_event.dart';
part 'phone_state.dart';
part 'phone_bloc.freezed.dart';

@injectable
class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final IAuthApiService _apiService;
  PhoneBloc(this._apiService) : super(PhoneState.initial()) {
    on<PhoneEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            state.copyWith(
              isEnableBtn: false,
              phoneNumber: "",
              redirectConfirmCode: false,
              redirectToPasswordScreen: false,
            ),
          );
        },
        changedTextValue: (e) async {
          emit(
            state.copyWith(
                phoneNumber: e.value,
                isEnableBtn: e.value.length >= 12,
                redirectConfirmCode: false,
                redirectToPasswordScreen: false),
          );
        },
        pressedBtn: (e) async {
          final hasAlreadyRegistered =
              await _apiService.getAuthInfo(state.phoneNumber);
          emit(
            state.copyWith(
              redirectConfirmCode: hasAlreadyRegistered.isLeft(),
              redirectToPasswordScreen: hasAlreadyRegistered.isRight(),
            ),
          );
        },
        resetStates: (e) async {
          emit(
            state.copyWith(
              isEnableBtn: state.phoneNumber.length >= 12,
              phoneNumber: state.phoneNumber,
              redirectConfirmCode: false,
              redirectToPasswordScreen: false,
            ),
          );
        },
      );
    });
  }
}
