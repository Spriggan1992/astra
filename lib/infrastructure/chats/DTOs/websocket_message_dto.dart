// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'websocket_message_dto.g.dart';
part 'websocket_message_dto.freezed.dart';

///Defines
@freezed
class WebsocketMessageDTO with _$WebsocketMessageDTO {
  const WebsocketMessageDTO._();
  const factory WebsocketMessageDTO({
    /// Identifier of chat.
    @JsonKey(name: 'id') int? id,

    /// Message
    @JsonKey(name: 'message') String? message,

    /// Identifier of chat.
    @JsonKey(name: 'action') required String action,

    /// Identifier of chat.
    @JsonKey(name: 'request_id') required String requiestId,

    /// Identifier of chat.
  }) = _WebsocketMessageDTO;

  /// Return DTO with information to connect to the chat.
  factory WebsocketMessageDTO.connectToChat(
    int chatId,
    String requestId,
  ) {
    return WebsocketMessageDTO(
      id: chatId,
      action: "join_chat",
      requiestId: requestId,
    );
  }

  /// Return DTO with subscription information.
  factory WebsocketMessageDTO.subscribeToMsg(
    int chatId,
    String requestId,
  ) {
    return WebsocketMessageDTO(
      id: chatId,
      action: "sub_to_message_in_chat",
      requiestId: requestId,
    );
  }

  /// Return DTO with message information for sending to the server.
  factory WebsocketMessageDTO.sendMessage(
    String message,
    String requestId,
  ) {
    return WebsocketMessageDTO(
      message: message,
      action: "send_message",
      requiestId: requestId,
    );
  }

// Return converted DTO from json.
  factory WebsocketMessageDTO.fromJson(Map<String, dynamic> json) =>
      _$WebsocketMessageDTOFromJson(json);
// Convert object to json.
  factory WebsocketMessageDTO.toJson() {
    return WebsocketMessageDTO.toJson();
  }
}
