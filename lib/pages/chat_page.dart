import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          children: [
            CircleAvatar(
              child: const Text(
                'NL',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Cons_villag',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _messages.length,
                    reverse: true,
                    itemBuilder: (_, i) => _messages[i])),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (text) {
              setState(() {
                if (text.trim().isNotEmpty) {
                  _isWriting = true;
                } else {
                  _isWriting = false;
                }
              });
            },
            decoration:
                const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Enviar'),
                      onPressed: _isWriting
                          ? () => _handleSubmit(_textController.text)
                          : null,
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                            onPressed: _isWriting
                                ? () => _handleSubmit(_textController.text)
                                : null,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            icon: const Icon(Icons.send)),
                      ),
                    )),
        ],
      ),
    ));
  }

  _handleSubmit(String text) {

    if (text.isEmpty) return;
    print(text);
    setState(() {
      _isWriting = false;
    });
    final newMessage = ChatMessage(
      uid: '123',
      text: text,
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 300)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController!.forward();
    _textController.clear();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: Off del socket

    for( ChatMessage message in _messages) {
      message.animationController!.dispose();
    }

    super.dispose();
  }
}
