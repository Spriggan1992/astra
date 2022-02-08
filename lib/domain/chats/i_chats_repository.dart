import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to Chats.
abstract class IChatsRepository {
  /// Get chats for the current user
  Future<Either<AstraFailure, List<ChatModel>>> getChats();
}
