

import 'package:dio/dio.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';

class GetYesNoAnswer {

  //Se crea instancia de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //obtener la respuesta
  Future<Message> getAnswer() async{
    //almacenar la peticionn Get en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    //Generar el error
    throw UnimplementedError();
  }
}