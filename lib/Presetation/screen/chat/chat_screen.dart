import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/widget/shared/message_field_box.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_manuel_4sa/presentation/providers/chat_provider.dart';

// Clase principal de la pantalla de chat
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar para el encabezado de la pantalla de chat
      appBar: AppBar(
        // Ícono de perfil (círculo con imagen)
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://cdna.pcpartpicker.com/static/forever/images/user/3991950.7888a5967c147968a6fb55cdac5095d5.256c.jpg"),
          ),
        ),
        // Título del chat con nombre y estado en línea
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
          children: [
            Text("Mi amor❤️😍"), // Nombre del contacto
            SizedBox(height: 2), // Espacio entre el nombre y el estado
            Text(
              'En línea', // Estado del contacto
              style: TextStyle(
                color: Colors.blue, // Color azul para indicar que está en línea
                fontSize: 12, // Tamaño pequeño para el estado
              ),
            ),
          ],
        ),
        centerTitle: false, // Alinea el título a la izquierda
      ),
      // Cuerpo de la pantalla que muestra la vista del chat
      body: _ChatView(),
    );
  }
}

// Vista privada del chat que muestra los mensajes y la caja de texto
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el proveedor de chat para manejar el estado del chat
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Lista de mensajes usando ListView.builder
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController, // Controlador para el scroll de la lista
                itemCount: chatProvider.messageList.length, // Número de mensajes
                itemBuilder: (context, index) {
                  // Obtiene el mensaje actual de la lista de mensajes
                  final message = chatProvider.messageList[index];
                  // Verifica de quién es el mensaje para mostrar la burbuja correcta
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message) // Burbuja de mensaje de la otra persona
                      : MyMessageBubble(message: message); // Burbuja de mensaje del usuario
                },
              ),
            ),
            // Caja de texto para enviar mensajes
            MessageFieldBox(
              // Función para enviar el mensaje cuando se cambia el valor del texto
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
