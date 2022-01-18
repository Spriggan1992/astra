import 'package:freezed_annotation/freezed_annotation.dart';
part 'applicant_info.freezed.dart';

/// Represent additional information about applicant such as characteristic,capabilities ets.
@freezed
class ApplicantInfo with _$ApplicantInfo{
   const ApplicantInfo._();

   const factory ApplicantInfo({
     //additional details header 
     required String title,
     //A description of additional information
     required String desc, 
   }) = _ApplicantInfo;

}