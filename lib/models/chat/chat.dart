import 'package:astra_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat extends Equatable {
  Chat({
    required this.id,
    required this.messages,
  });

  final int id;
  final List<Message> messages;

  @override
  get props => [id, messages];

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
