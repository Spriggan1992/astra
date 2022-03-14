part of 'search_action_bloc.dart';

/// User event
@freezed
class SearchActionEvent with _$SearchActionEvent {
  const factory SearchActionEvent.like({required int id}) = _Like;
  const factory SearchActionEvent.block({required int id}) = _Bloc;
  const factory SearchActionEvent.reject({required int id}) = _Reject;
  const factory SearchActionEvent.think({required int id}) = _Think;
  const factory SearchActionEvent.accountShown() = _AccountShown;
}
