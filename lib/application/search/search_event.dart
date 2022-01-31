part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.loadData() = _Search;
  const factory SearchEvent.like({required int id}) = _Like;
  const factory SearchEvent.block({required int id}) = _bloc;
  const factory SearchEvent.reject({required int id}) = _reject;
  const factory SearchEvent.think({required int id}) = _think;
}
