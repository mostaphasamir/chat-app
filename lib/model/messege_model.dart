class MessageModel
{
  final String message ;
  final String senderId;
  final String receiverId;

  MessageModel(this.message, this.senderId, this.receiverId);

  factory MessageModel.fromJson(jsonData)
  {
    return MessageModel(jsonData['message'],jsonData['senderId'],jsonData['receiverId']);
  }

  Map <String , dynamic> toMap()
  {
    return {
      'message':message,
      'senderId':senderId,
      'receiverId':receiverId,
      'dateTime':DateTime.now(),
    };
  }
}