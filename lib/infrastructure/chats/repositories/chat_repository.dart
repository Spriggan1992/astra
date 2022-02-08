import 'dart:async';
import 'package:astra_app/domain/chats/i_chat_repository.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/infrastructure/chats/DTOs/message_dto.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Represent chat repository.
@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  // Dio client.
  final Dio _dio;

  ChatRepository(this._dio);
  @override
  Future<Either<AstraFailure, List<MessageModel>>> getChatHisory(
      int chatId) async {
    final result = await makeRequest<List<MessageModel>>(() async {
      final response = await _dio.get(Endpoints.chat.getMessages(chatId));
      return (response.data as List<dynamic>)
          .map((e) => MessageDTO.fromJson(e).toDomain())
          .toList()
          .reversed
          .toList();
    });
    return result.fold((failure) => left(failure), (profile) => right(profile));
  }
}
