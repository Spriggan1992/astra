import 'package:equatable/equatable.dart';

import 'message.dart';

class Chat extends Equatable {
  const Chat({
    required this.id,
    required this.messages,
  });

  static Chat empty() => const Chat(id: 0, messages: []);

  final int id;
  final List<Message> messages;

  @override
  get props => [id, messages];
}
