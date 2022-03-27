import 'dart:developer';
import 'package:astra_app/auth/core/domain/i_auth_api_service.dart';
import 'package:astra_app/auth/core/domain/models/auth_info.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'confirm_password_event.dart';
part 'confirm_password_state.dart';
part 'confirm_password_bloc.freezed.dart';

@injectable
class ConfirmPasswordBloc
    extends Bloc<ConfirmPasswordEvent, ConfirmPasswordState> {
  final IAuthApiService _apiService;
  ConfirmPasswordBloc(this._apiService)
      : super(ConfirmPasswordState.initial()) {
    on<ConfirmPasswordEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            state.copyWith(
                confirmPassword: e.confirmPassword, phoneNumber: e.phoneNumber),
          );
        },
        changedPassword: (e) async {
          final isValid =
              e.password.length == 4 && state.confirmPassword == e.password;
          emit(
            state.copyWith(isEnableBtn: isValid, isShowError: false),
          );
        },
        submittedPassword: (e) async {
          final isValid = state.confirmPassword == e.password;
          emit(
            state.copyWith(
              isShowError: !isValid,
              isEnableBtn: isValid,
            ),
          );
        },
        pressedButton: (e) async {
          final response = await _apiService.signUp(
            AuthInfo(
              phoneNumber: state.phoneNumber,
              password: state.confirmPassword,
            ),
          );
          response.fold(
            (_) => log("что-то пошло не так."),
            (_) => emit(
              state.copyWith(isSuccessfullySubmitted: true),
            ),
          );
        },
      );
    });
  }
}
