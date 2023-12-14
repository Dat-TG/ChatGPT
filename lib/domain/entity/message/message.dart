enum Role {
  user,
  assistant,
}

class Message {
  Role role;
  String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        role: Role.values.byName(json["role"]),
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "role": role.name,
        "content": content,
      };
}
