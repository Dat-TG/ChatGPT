import 'package:boilerplate/domain/entity/message/message.dart';

class MessageWithTime {
  final Message message;
  final DateTime time;

  MessageWithTime(this.message, this.time);

  factory MessageWithTime.fromMap(Map<String, dynamic> json) => MessageWithTime(
        Message.fromMap(json["message"]),
        DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message.toMap(),
        "time": time.toIso8601String(),
      };
}
