class Message {
  Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.message,
    required this.messageType,
    required this.timestamp,
    required this.dismissed,
  });

  final String id;
  final String conversationId;
  final String senderId;
  final String message;
  final String messageType;
  final int timestamp;
  final bool dismissed;
}

class MessageDB {
  final List<Message> _messages = [
    Message(
      id: '1',
      conversationId: '1',
      senderId: '1',
      message: 'Hello! How can I help you with your nutrition today?',
      messageType: 'text',
      timestamp: 1676533248000,
      dismissed: false,
    ),
    Message(
      id: '2',
      conversationId: '1',
      senderId: '2',
      message: 'Hi! I need some advice on a good protein source.',
      messageType: 'text',
      timestamp: 1676533258000,
      dismissed: false,
    ),
    Message(
      id: '3',
      conversationId: '1',
      senderId: '1',
      message: 'Sure! Chickpeas, lentils, and tofu are excellent sources of protein.',
      messageType: 'text',
      timestamp: 1676533268000,
      dismissed: false,
    ),
    Message(
      id: '4',
      conversationId: '1',
      senderId: 'aiAgent',
      message: "It seems like you're discussing various protein sources! According to the NOVA classification:\n- Chickpeas and lentils are 'unprocessed or minimally processed foods'.\n- Tofu is 'processed culinary ingredient'.\nWould you like tips on incorporating these into a balanced diet?",
      messageType: 'text',
      timestamp: 1676533298000,
      dismissed: false,
    ),
    Message(
      id: '5',
      conversationId: '1',
      senderId: 'aiAgent',
      message: "It seems like...",
      messageType: 'text',
      timestamp: 1676533298000,
      dismissed: true,
    ),
  ];

  Message getMessage(String id) {
    return _messages.firstWhere((message) => message.id == id);
  }

  List<Message> getMessagesByConversationId(String conversationId) {
    return _messages.where((message) => message.conversationId == conversationId).toList();
  }
}

MessageDB messageDB = MessageDB();