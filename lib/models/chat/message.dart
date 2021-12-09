import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends Equatable{
  Message({
    required this.text,
    required this.sender,
    required this.read,
    required this.timeSent,
});

  final String text;
  final String sender;
  final DateTime timeSent;
  final bool read;

  @override
  get props => [text, sender, timeSent, read];

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}