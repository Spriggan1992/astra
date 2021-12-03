import 'package:astra_app/model/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial()) {}

  void changePhoneNumber(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(phoneNumber: value, status: LoginStatus.initial));
    } else {
      emit(state.copyWith(phoneNumber: value, status: LoginStatus.success));
    }
  }

  void getSmsCode() {
    emit(state.copyWith(smsCode: '1234'));
  }
}
