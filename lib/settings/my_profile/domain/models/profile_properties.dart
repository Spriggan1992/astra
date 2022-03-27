
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_properties.freezed.dart';

/// Represent profile additional info.
@freezed
class ProfileProperties with _$ProfileProperties{
  const ProfileProperties._();

  const factory ProfileProperties({
    /// Profile additional info title such as character, orientation e.t.c.
    required final String title, 

    /// Profile additional info.
    required final String value, 
  })=_ProfileProperties; 

}