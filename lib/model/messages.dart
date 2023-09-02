// ignore_for_file: empty_constructor_bodies

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['message'], jsonData['id']);
  }
}
