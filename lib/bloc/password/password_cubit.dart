import 'package:astra_app/model/failure.dart';
import 'package:astra_app/repositories/local_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit({required this.localRepository})
      : super(PasswordState.initial()) {}

  final LocalRepository localRepository;

  void onChangePassword(String value) {
    emit(state.copyWith(password: value));
  }

  void savePassword() async {
    await localRepository.save(LocalRepository.keyPassword, state.password);
    emit(state.copyWith(status: PasswordStatus.success));
  }

  void enterToApp() async {
    emit(state.copyWith(status: PasswordStatus.succsessPassword));
  }
}
