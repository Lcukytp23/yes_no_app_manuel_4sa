import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  // Callback que se llama cuando el valor del texto cambia
  final ValueChanged<String> onValue;
  
  // Constructor, requiere `onValue` para notificar el texto cambiado
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // Controlador de texto para manejar el contenido del campo de texto
    final textController = TextEditingController();

    // Nodo de enfoque para manejar el foco del campo de texto
    final focusNode = FocusNode();

    // Estilo de borde subrayado personalizado, sin color de borde y con bordes redondeados
    final outlinedBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40), // Radio para bordes redondeados
    );

    // Decoración para el campo de texto, incluye hint, bordes y un icono de envío
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"', // Texto de sugerencia en el campo de texto
      enabledBorder: outlinedBorder, // Borde cuando el campo no está enfocado
      focusedBorder: outlinedBorder, // Borde cuando el campo está enfocado
      filled: true, // Rellena el fondo del campo de texto
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_and_archive_outlined), // Icono de enviar
        onPressed: () {
          // Obtiene el valor del texto actual
          final textValue = textController.value.text;
          // Llama al callback `onValue` para notificar el texto
          onValue(textValue);
          // Limpia el campo de texto
          textController.clear();
        },
      ),
    );

    return TextFormField(
      // Evento que se dispara cuando se hace clic fuera del campo de texto
      onTapOutside: (event) {
        focusNode.unfocus(); // Pierde el enfoque cuando se toca fuera
      },
      focusNode: focusNode, // Asigna el nodo de enfoque al campo de texto
      controller: textController, // Controlador para manejar el contenido
      decoration: inputDecoration, // Decoración personalizada para el campo de texto
      onFieldSubmitted: (value) {
        // Evento que se dispara al presionar "Enter" o "Submit" en el teclado
        print("Submit value $value"); // Imprime el valor en la consola (para depuración)
        textController.clear(); // Limpia el campo de texto después de enviar
        focusNode.requestFocus(); // Devuelve el enfoque al campo de texto
        onValue(value); // Llama al callback `onValue` para notificar el texto
      },
    );
  }
}
