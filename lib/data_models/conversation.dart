class Conversation {
  Conversation({
    required this.id,
    required this.userIds,
    required this.messageIds,
  });

  String id;
  List<String> userIds;
  List<String> messageIds;
}

class ConversationDB {
  final List<Conversation> _conversations = [
    Conversation(
      id: '1',
      userIds: ['1', '2'],
      messageIds: ['1', '2', '3', '4', '5'],
    ),
    Conversation(
      id: '2',
      userIds: ['4', '3'],
      messageIds: ['1'],
    ),
  ];

  Conversation getConversationByUserId(String userId) {
    return _conversations.firstWhere((conversation) => conversation.userIds.contains(userId));
  }
}

ConversationDB conversationDB = ConversationDB();