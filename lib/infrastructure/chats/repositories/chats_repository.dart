import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/domain/chats/i_chats_repository.dart';
import 'package:astra_app/infrastructure/chats/DTOs/chat_dto.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Represent repository for chats.
@LazySingleton(as: IChatsRepository)
class ChatsRepository implements IChatsRepository {
  /// Dio client.
  final Dio _dio;

  ChatsRepository(this._dio);
  @override
  Future<Either<AstraFailure, List<ChatModel>>> getChats() async {
    final result = await makeRequest<List<ChatModel>>(() async {
      final response = await _dio.get(Endpoints.chat.chats);
      return (response.data as List<dynamic>)
          .map((e) => ChatDTO.fromJson(e).toDomain())
          .toList();
    });
    return result.fold((failure) => left(failure), (profile) => right(profile));
  }
}
