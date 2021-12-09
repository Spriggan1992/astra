// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      text: json['text'] as String,
      sender: json['sender'] as String,
      read: json['read'] as bool,
      timeSent: DateTime.parse(json['timeSent'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'sender': instance.sender,
      'timeSent': instance.timeSent.toIso8601String(),
      'read': instance.read,
    };
