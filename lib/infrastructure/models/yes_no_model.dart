//El modelo define que datos debe tener la aplicacion de diseño de software
//Investigar MVC: Modelo = datos
// Vista: Pantalla, Controlador: lógica

class YesNoModel {
  //Atributos de clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}