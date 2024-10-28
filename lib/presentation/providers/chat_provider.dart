import 'package:flutter/material.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{
  List<Message> messageList=[
    Message(text: "Hola Ader", fromWho: FromWho.me),
    Message(text: "¿Lloras por que reprobaste topicos?", fromWho: FromWho.me)
  ];
  // controlador para manejar la posicion del Scroll
  final ScrollController chatScrollController = ScrollController();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser "me" por que yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    //notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }
    

    //Mover el scroll al último mensaje
    Future<void> moveScrollToBottom() async {
      // un pequeño atraso en la animacion para garantizar que siempre se vera aun cuando
      // se envien mensajes cortos y rapidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
        // offset: posicion de la animacion
        // maxScrollExtent determina a lo maximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 300),
        //"Rebote" al final de la animacion 
        curve: Curves.easeOut);
    }
  }