import 'package:equatable/equatable.dart';

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
}