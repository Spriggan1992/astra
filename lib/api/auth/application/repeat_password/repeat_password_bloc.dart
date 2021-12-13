import 'dart:developer';

import 'package:astra_app/api/auth/domain/auth_info.dart';
import 'package:astra_app/api/auth/infrastructure/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'repeat_password_event.dart';
part 'repeat_password_state.dart';
part 'repeat_password_bloc.freezed.dart';

@injectable
class RepeatPasswordBloc
    extends Bloc<RepeatPasswordEvent, RepeatPasswordState> {
  final IAuthApiService _apiService;
  RepeatPasswordBloc(this._apiService) : super(RepeatPasswordState.initial()) {
    on<RepeatPasswordEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            state.copyWith(
                confirmePassword: e.confirmePassword,
                phoneNumber: e.phoneNumber),
          );
        },
        changedPassword: (e) async {
          final isValid =
              e.password.length == 4 && state.confirmePassword == e.password;
          emit(
            state.copyWith(isEnableBtn: isValid, isShowError: false),
          );
        },
        submittedPassword: (e) async {
          final isVaid = state.confirmePassword == e.password;
          emit(
            state.copyWith(
              isShowError: !isVaid,
              isEnableBtn: isVaid,
            ),
          );
        },
        pressedButn: (e) async {
          final response = await _apiService.signUp(
            AuthInfo(
                phoneNumber: state.phoneNumber,
                password: state.confirmePassword,
                isSignIn: true),
          );
          response.fold(
            (l) => log("что-то пошло не так."),
            (r) => emit(
              state.copyWith(isSuccessfullySubmitted: true),
            ),
          );
        },
      );
    });
  }
}
