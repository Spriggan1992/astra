part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.loadData({required Profile? profile}) = _Search;
}
