import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../constants.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime time;

  Message({required this.text, required this.isUser, required this.time});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add(Message(
      text: "Hi! How are you feeling today 😊?",
      isUser: false,
      time: DateTime.now(),
    ));
  }

  void _handleSend() {
    if (_controller.text.isEmpty) return;

    final userMessage = Message(
      text: _controller.text,
      isUser: true,
      time: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
    });

    _getResponseFromGemini(_controller.text);
    _controller.clear();
  }

  Future<void> _getResponseFromGemini(String query) async {
    try {
      final response = await http.post(
        Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$APIKEY'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "Act as a friendly therapist named Carl. Reply to: $query"}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final botText = responseData['candidates'][0]['content']['parts'][0]['text'];

        setState(() {
          _messages.add(Message(text: botText, isUser: false, time: DateTime.now()));
          _isLoading = false;
        });
      } else {
        _addErrorMessage();
      }
    } catch (e) {
      _addErrorMessage();
    }
  }

  void _addErrorMessage() {
    setState(() {
      _messages.add(Message(
        text: "Oops! I'm having some trouble connecting. Try again later.",
        isUser: false,
        time: DateTime.now(),
      ));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Carl is typing...", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
            ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.lightGray,
                child: Icon(Icons.smart_toy_outlined, color: AppColors.primaryPurple),
              ),
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
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Chat Bot(Bob)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Online', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!message.isUser)
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.lightGray,
                  child: Icon(Icons.smart_toy_outlined, size: 20, color: AppColors.primaryPurple),
                ),
              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: message.isUser ? null : AppColors.lightGray,
                    gradient: message.isUser
                        ? const LinearGradient(
                            colors: [Color(0xFF8A2BE2), Color(0xFF6A1B9A)],
                          )
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                      bottomLeft: Radius.circular(message.isUser ? 15 : 0),
                      bottomRight: Radius.circular(message.isUser ? 0 : 15),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser ? Colors.white : Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: message.isUser ? 0 : 40, right: message.isUser ? 10 : 0),
            child: Text(
              "${message.time.hour}:${message.time.minute.toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 20)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.grey)),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Type something',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _handleSend,
              icon: const Icon(Icons.send, color: AppColors.primaryPurple),
            ),
          ],
        ),
      ),
    );
  }
}
