import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/shared/message_field_box.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_manuel_4sa/presentation/providers/chat_provider.dart';

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
        title: const Text("Mi amor❤️😍"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //Instacia del mensaje que sabra de quien es el mensaje
                final message = chatProvider.messageList[index];
              return (message.fromWho == FromWho.hers)
              ? HerMessageBubble()
              :MyMessageBubble(message: message,);
            },)
            ),
            //Caja de Texto de mensajes
            MessageFieldBox(
              //Una Vez que tenga el valor cambiado, envialo
              onValue: chatProvider.sendMessage,),
          ],
        ),
      ),
    );
  }
}