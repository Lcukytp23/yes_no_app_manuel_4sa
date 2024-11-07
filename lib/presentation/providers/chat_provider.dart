import 'package:flutter/material.dart';
import 'package:yes_no_app_manuel_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{
  List<Message> messageList=[
    Message(text: "Hola Ader", fromWho: FromWho.me),
    Message(text: "¿Lloras por que reprobaste topicos?", fromWho: FromWho.me)
  ];
  // controlador para manejar la posicion del Scroll
  final ScrollController chatScrollController = ScrollController();

  //Instancia de la calse GETYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();



  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //Verifica que el texto no esté vacio
    if (text.trim().isEmpty) return;
    //El mensaje siempre va a ser "me" por que yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    if (text.endsWith("?")){
      herReply();
    }
    //Imprime la cantidad de elemntos en la lista
    print("Cantidad de mensajes: ${messageList.length}");
    //notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }
    

    //Mover el scroll al último mensaje
    Future<void> moveScrollToBottom() async {
    if (chatScrollController.hasClients){
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
  
  Future<void> herReply() async {
    //Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir el mesnaje de mi crush a la lista
    messageList.add(herMessage);
    // Notifica si algo de provider cambio para el estado
    notifyListeners();
    //Mueve el scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
  }
}