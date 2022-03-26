import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'logout_state.dart';
part 'logout_cubit.freezed.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutState.initial());

  /// Set logout state.
  void setLogoutState(bool canLogout) {
    emit(state.copyWith(canLogout: canLogout));
  }
}
