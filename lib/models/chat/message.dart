import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.text,
    required this.sender,
    required this.read,
    required this.timeSent,
  });

  final String text;
  final String sender;
  final DateTime timeSent;
  final bool read;

  static empty() => Message(
        text: '',
        sender: '',
        read: false,
        timeSent: DateTime(1, 1, 1, 0, 0, 0, 0),
      );

  get time {
    String hour = '${timeSent.hour}';
    String minite = '${timeSent.minute}';

    if (hour.length == 1) {
      hour = '0$hour';
    }
    if (minite.length == 1) {
      minite = '0$minite';
    }

    final difference = timeSent.difference(DateTime.now()).inHours;

    if (difference > 12) {
      return '${timeSent.day}';
    } else {
      return '$hour:$minite';
    }
  }

  @override
  get props => [text, sender, timeSent, read];
}
