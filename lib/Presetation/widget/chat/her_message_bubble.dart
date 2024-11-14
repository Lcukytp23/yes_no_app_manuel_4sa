import 'package:flutter/material.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message; // Mensaje recibido
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Obtiene los colores del tema actual
    final timeFormat = DateFormat('HH:mm'); // Formato de 24 horas para la hora

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido a la izquierda
      children: [
        // Burbuja de texto
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Color de fondo de la burbuja
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Texto del mensaje
              style: const TextStyle(color: Colors.white), // Texto en color blanco
            ),
          ),
        ),
        const SizedBox(height: 5), // Espacio entre la burbuja de texto y la imagen

        // Burbuja de imagen (si existe una URL de imagen)
        _ImageBubble(imageUrl: message.imageUrl!), // Muestra la imagen recibida

        // Muestra la hora del mensaje
        Text(
          timeFormat.format(message.timestamp), // Formatea la hora del mensaje
          style: const TextStyle(color: Colors.grey, fontSize: 12), // Texto gris y pequeño
        ),

        const SizedBox(height: 10), // Espacio debajo de la hora
        //Toda imagen
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {
  final String imageUrl; // URL de la imagen

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtiene el tamaño de la pantalla

    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Bordes redondeados para la imagen
      child: Image.network(
        imageUrl, // Carga la imagen desde la URL
        width: size.width * 0.7, // Ancho del 70% del tamaño de la pantalla
        height: 150, // Altura fija de 150 píxeles
        fit: BoxFit.cover, // Ajusta la imagen para cubrir el contenedor
        loadingBuilder: (context, child, loadingProgress) {
          // Muestra el child si la imagen ya está cargada
          if (loadingProgress == null) return child;

          // Muestra un contenedor de carga mientras se descarga la imagen
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Mi amor esta enviando una imagen"), // Texto temporal
          );
        },
      ),
    );
  }
}
