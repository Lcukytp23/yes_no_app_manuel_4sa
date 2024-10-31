import 'package:flutter/material.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://cdna.pcpartpicker.com/static/forever/images/user/3991950.7888a5967c147968a6fb55cdac5095d5.256c.jpg"),
          ),
        ),
        title: const Text("Mi amor"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return (index % 2 == 0)
              ? const HerMessageBubble()
              :const MyMessageBubble();
            },)
            ),
            //Caja de Texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}