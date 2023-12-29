import 'package:boilerplate/domain/entity/message/message_with_time.dart';

class ChatThread {
  int id;
  String subject;
  List<MessageWithTime> messages;
  ChatThread({
    required this.id,
    required this.subject,
    required this.messages,
  });
  factory ChatThread.fromMap(Map<String, dynamic> json) => ChatThread(
        id: json["id"],
        subject: json["subject"],
        messages: List<MessageWithTime>.from(
            json["messages"].map((x) => MessageWithTime.fromMap(x))),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "subject": subject,
        "messages": List<dynamic>.from(messages.map((x) => x.toMap())),
      };
  ChatThread copyWith({
    int? id,
    String? subject,
    List<MessageWithTime>? messages,
  }) {
    return ChatThread(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      messages: messages ?? this.messages,
    );
  }
}
