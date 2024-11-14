//El modelo define que datos debe tener la aplicacion de diseño de software
//Investigar MVC: Modelo = datos
// Vista: Pantalla, Controlador: lógica

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);


import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );
  Message toMessageEntity() => Message(
    //Condicional ternario para darle valor a los mensajes
    text: answer == "yes"
    ? "Si" 
    : answer == 'no' 
      ? "No"
      :'Quizás',
    // siempre va a ser de ella 
    fromWho: FromWho.hers,
    //Será el gif
    imageUrl: image,
    DateTime.timestamp(),
    MessageStatus.sent
    );

}