import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(const EnhancedChatApp());
}

class EnhancedChatApp extends StatelessWidget {
  const EnhancedChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRYB3 Enhanced Chat',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B35),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
          primary: const Color(0xFFFF6B35),
          secondary: const Color(0xFF4ECDC4),
        ),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const ChatListPage(),
    );
  }
}

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<ChatItem> _chats = [
    ChatItem(
      id: '1',
      name: 'Design Team',
      lastMessage: 'The new mockups look amazing! 🎨',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 3,
      avatarColor: Colors.purple,
      isOnline: true,
      chatType: ChatType.group,
    ),
    ChatItem(
      id: '2',
      name: 'Sarah Wilson',
      lastMessage: 'Perfect! See you at 3 PM',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 15)),
      unreadCount: 0,
      avatarColor: Colors.pink,
      isOnline: true,
      chatType: ChatType.direct,
    ),
    ChatItem(
      id: '3',
      name: 'Product Launch',
      lastMessage: 'Launch is scheduled for next week',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
      unreadCount: 1,
      avatarColor: Colors.orange,
      isOnline: false,
      chatType: ChatType.group,
    ),
    ChatItem(
      id: '4',
      name: 'Mike Chen',
      lastMessage: 'Thanks for the code review!',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
      unreadCount: 0,
      avatarColor: Colors.blue,
      isOnline: true,
      chatType: ChatType.direct,
    ),
    ChatItem(
      id: '5',
      name: 'Marketing Team',
      lastMessage: 'Campaign metrics look great',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 4)),
      unreadCount: 12,
      avatarColor: Colors.green,
      isOnline: false,
      chatType: ChatType.group,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Enhanced App Bar
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: const Color(0xFFFF6B35),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Messages',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              '${_chats.length} conversations',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.chat_bubble_outline,
                          size: 40,
                          color: Colors.white24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          
          // Online Users Strip
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _chats.where((c) => c.isOnline && c.chatType == ChatType.direct).length,
                itemBuilder: (context, index) {
                  final onlineUsers = _chats.where((c) => c.isOnline && c.chatType == ChatType.direct).toList();
                  final chat = onlineUsers[index];
                  return Container(
                    width: 70,
                    margin: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: chat.avatarColor,
                              child: Text(
                                chat.name[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chat.name.split(' ')[0],
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Chat List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = _chats[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: chat.avatarColor,
                          child: chat.chatType == ChatType.group
                              ? const Icon(Icons.group, color: Colors.white)
                              : Text(
                                  chat.name[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        if (chat.isOnline && chat.chatType == ChatType.direct)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          _formatTime(chat.lastMessageTime),
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.lastMessage,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (chat.unreadCount > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6B35),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              chat.unreadCount > 99 ? '99+' : '${chat.unreadCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnhancedChatPage(chat: chat),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: _chats.length,
            ),
          ),
        ],
      ),
      
      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF4ECDC4),
        icon: const Icon(Icons.add),
        label: const Text('New Chat'),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h';
    } else {
      return '${diff.inDays}d';
    }
  }
}

class EnhancedChatPage extends StatefulWidget {
  final ChatItem chat;

  const EnhancedChatPage({super.key, required this.chat});

  @override
  State<EnhancedChatPage> createState() => _EnhancedChatPageState();
}

class _EnhancedChatPageState extends State<EnhancedChatPage>
    with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _typingController;
  late AnimationController _messageController2;
  
  bool _isTyping = false;
  bool _showEmojiPicker = false;
  
  final List<ChatMessage> _messages = [
    ChatMessage(
      id: '1',
      content: 'Hey! How are you doing today?',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isSentByMe: false,
      messageType: MessageType.text,
    ),
    ChatMessage(
      id: '2',
      content: "I'm doing great! Just finished the new designs for TRYB3",
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 55)),
      isSentByMe: true,
      messageType: MessageType.text,
    ),
    ChatMessage(
      id: '3',
      content: 'Wow, that sounds awesome! Can you share a preview? 🎨',
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 50)),
      isSentByMe: false,
      messageType: MessageType.text,
    ),
    ChatMessage(
      id: '4',
      content: 'Sure! Here you go',
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 45)),
      isSentByMe: true,
      messageType: MessageType.text,
    ),
    ChatMessage(
      id: '5',
      content: '',
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 44)),
      isSentByMe: true,
      messageType: MessageType.image,
      imageUrl: 'https://images.unsplash.com/photo-1611224923853-80b023f02d71?w=300',
    ),
    ChatMessage(
      id: '6',
      content: 'This looks incredible! The gradient and typography choices are perfect 👌',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isSentByMe: false,
      messageType: MessageType.text,
    ),
    ChatMessage(
      id: '7',
      content: 'Thank you! It took me a while to get the colors just right',
      timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
      isSentByMe: true,
      messageType: MessageType.text,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _typingController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    
    _messageController2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _typingController.dispose();
    _messageController2.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: _messageController.text.trim(),
        timestamp: DateTime.now(),
        isSentByMe: true,
        messageType: MessageType.text,
      ));
    });

    _messageController.clear();
    _scrollToBottom();
    
    // Simulate response
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _messages.add(ChatMessage(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            content: _getRandomResponse(),
            timestamp: DateTime.now(),
            isSentByMe: false,
            messageType: MessageType.text,
          ));
        });
        _scrollToBottom();
      }
    });
  }

  String _getRandomResponse() {
    final responses = [
      "That's interesting! Tell me more 🤔",
      "I completely agree! 💯",
      "Thanks for sharing that with me",
      "Sounds like a great plan! 🚀",
      "Let's discuss this further",
      "Perfect! I'll work on that",
      "That makes total sense 👍",
    ];
    return responses[Random().nextInt(responses.length)];
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          // Enhanced Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: widget.chat.avatarColor,
                          child: widget.chat.chatType == ChatType.group
                              ? const Icon(Icons.group, color: Colors.white, size: 20)
                              : Text(
                                  widget.chat.name[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        if (widget.chat.isOnline && widget.chat.chatType == ChatType.direct)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.chat.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.chat.isOnline)
                            const Text(
                              'Active now',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            )
                          else
                            const Text(
                              'Last seen 2h ago',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.videocam, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.call, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isTyping) {
                  return _buildTypingIndicator();
                }
                
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          
          // Input Area
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: const Color(0xFF4ECDC4),
                  ),
                  onPressed: () {
                    _showAttachmentOptions();
                  },
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {
                            setState(() {
                              _showEmojiPicker = !_showEmojiPicker;
                            });
                          },
                        ),
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isSentByMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isSentByMe)
            CircleAvatar(
              radius: 16,
              backgroundColor: widget.chat.avatarColor,
              child: Text(
                widget.chat.name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                gradient: message.isSentByMe
                    ? const LinearGradient(
                        colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                      )
                    : null,
                color: message.isSentByMe ? null : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.messageType == MessageType.image && message.imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        message.imageUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 200,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Text(
                      message.content,
                      style: TextStyle(
                        color: message.isSentByMe ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    _formatMessageTime(message.timestamp),
                    style: TextStyle(
                      color: message.isSentByMe
                          ? Colors.white70
                          : Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isSentByMe) const SizedBox(width: 8),
          if (message.isSentByMe)
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF4ECDC4),
              child: const Text(
                'Y',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: widget.chat.avatarColor,
            child: Text(
              widget.chat.name[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(0),
                const SizedBox(width: 4),
                _buildTypingDot(200),
                const SizedBox(width: 4),
                _buildTypingDot(400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int delay) {
    return AnimatedBuilder(
      animation: _typingController,
      builder: (context, child) {
        final value = (_typingController.value * 1500 - delay) / 1500;
        final opacity = (sin(value * pi * 2) + 1) / 2;
        
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(opacity.clamp(0.3, 1.0)),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  String _formatMessageTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : hour == 0 ? 12 : hour;
    
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAttachmentOption(
                    Icons.camera_alt,
                    'Camera',
                    Colors.green,
                    () {},
                  ),
                  _buildAttachmentOption(
                    Icons.photo_library,
                    'Gallery',
                    Colors.purple,
                    () {},
                  ),
                  _buildAttachmentOption(
                    Icons.insert_drive_file,
                    'Document',
                    Colors.blue,
                    () {},
                  ),
                  _buildAttachmentOption(
                    Icons.location_on,
                    'Location',
                    Colors.red,
                    () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttachmentOption(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// Models
class ChatItem {
  final String id;
  final String name;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final Color avatarColor;
  final bool isOnline;
  final ChatType chatType;

  ChatItem({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.avatarColor,
    required this.isOnline,
    required this.chatType,
  });
}

class ChatMessage {
  final String id;
  final String content;
  final DateTime timestamp;
  final bool isSentByMe;
  final MessageType messageType;
  final String? imageUrl;

  ChatMessage({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.isSentByMe,
    required this.messageType,
    this.imageUrl,
  });
}

enum ChatType { direct, group }
enum MessageType { text, image, file, location }