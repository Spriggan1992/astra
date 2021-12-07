import 'package:astra_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  Chat({
    required this.id,
    required this.messages,
});

  final int id;
  final List<Message> messages;

  @override
  get props => [id, messages];
}