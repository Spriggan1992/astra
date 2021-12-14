import 'dart:developer';

import 'package:astra_app/domain/auth/entities/auth_info.dart';
import 'package:astra_app/domain/auth/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'password_event.dart';
part 'password_state.dart';
part 'password_bloc.freezed.dart';

@injectable
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final IAuthApiService _apiService;
  PasswordBloc(this._apiService) : super(PasswordState.initial()) {
    on<PasswordEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          final isSignIn = e.code == null;
          final emptyAuthInfo = AuthInfo.empty();
          AuthInfo authInfo = emptyAuthInfo;
          if (isSignIn) {
            final authInfoDTO = await _apiService.getAuthInfo(e.phoneNumber);
            authInfo = authInfoDTO.fold(
              (l) => emptyAuthInfo,
              (r) => r.toDomain(),
            );
          }
          emit(
            state.copyWith(
              code: e.code,
              phoneNumber: e.phoneNumber,
              authInfo: authInfo,
              isSignIn: isSignIn,
            ),
          );
        },
        changedPassword: (e) async {
          final isValid = state.isSignIn
              ? e.password == state.authInfo.password
              : e.password.length == 4;
          emit(
            state.copyWith(
              password: e.password,
              isEnableBtn: isValid,
              isShowError: false,
            ),
          );
        },
        pressedButn: (e) async {
          if (state.isSignIn) {
            final response = await _apiService.signIn(
              AuthInfo(
                  phoneNumber: state.phoneNumber,
                  password: state.password,
                  isSignIn: true),
            );
            response.fold(
              (fail) => log("что-то пошло не так"),
              (suscess) => emit(
                state.copyWith(
                  isSuseccfullySignIn: response.isRight(),
                ),
              ),
            );
          } else {
            emit(
              state.copyWith(redirectToConfirmePassword: true),
            );
          }
        },
        submittedPassword: (e) async {
          final isShowError =
              state.isSignIn ? e.password != state.authInfo.password : false;
          emit(
            state.copyWith(isShowError: isShowError),
          );
        },
      );
    });
  }
}
