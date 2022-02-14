import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_model.freezed.dart';

///Defines
@freezed
class SubscriptionModel<T> with _$SubscriptionModel<T> {
  const SubscriptionModel._();
  const factory SubscriptionModel({
    required String topicName,
    T? item,
  }) = _SubscriptionModel<T>;

  /// Empty .
// factory SubscriptionModel.empty() => const SubscriptionModel()
}
