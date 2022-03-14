import 'package:astra_app/domain/favorites/match_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'match_model.freezed.dart';

///Defines
@freezed
class MatchModel with _$MatchModel {
  const MatchModel._();
  const factory MatchModel({
    required MatchStatus status,
  }) = _MatchModel;

  /// Empty .
  factory MatchModel.empty() => const MatchModel(status: MatchStatus.initial);
}
