part of 'profile_properties_bloc.dart';

@freezed
class ProfilePropertiesEvent with _$ProfilePropertiesEvent {
  /// Load profile properties data from server
  /// 
  /// [id] - is an applicant id. 
  const factory ProfilePropertiesEvent.load(int id) = _Load;
}