import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

import 'message_model.dart';

/// Describe chat repository.
abstract class IChatRepository {
  /// Load chat hisoty for the chat with [chatId].
  Future<Either<AstraFailure, List<MessageModel>>> getChatHisory(int chatId);
}
