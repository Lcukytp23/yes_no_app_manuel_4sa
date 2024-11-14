import 'package:flutter/material.dart';
import 'package:yes_no_app_manuel_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message; // Objeto de mensaje que contiene el texto y la hora
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final timeFormat = DateFormat('HH:mm'); // Formato para mostrar la hora

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Alinea los elementos a la derecha
      children: [
        // Contenedor de la burbuja de mensaje
        Container(
          decoration: BoxDecoration(
            color: colors.primary, // Color de fondo de la burbuja
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Texto del mensaje
              style: const TextStyle(color: Colors.white), // Texto blanco
            ),
          ),
        ),
        const SizedBox(height: 5), // Espacio entre la burbuja y la información de estado

        // Fila para mostrar la hora y el ícono de "mensaje leído"
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // Alinea los elementos a la derecha
          children: [
            // Mostrar el texto "Leído"
            Text(
              message.isRead ? 'Leído' : 'Leído', // Texto fijo, siempre muestra "Leído"
              style: const TextStyle(
                fontSize: 12, // Tamaño de fuente pequeño
                color: Colors.grey, // Color gris para el texto
              ),
            ),
            const SizedBox(width: 5), // Espacio entre el texto y la hora

            // Mostrar la hora del mensaje
            Text(
              timeFormat.format(message.timestamp), // Formatea la fecha del mensaje
              style: const TextStyle(color: Colors.grey, fontSize: 12), // Estilo gris y pequeño
            ),
            const SizedBox(width: 5), // Espacio entre la hora y el ícono

            // Ícono de "mensaje leído"
            const Icon(
              Icons.done_all, // Ícono de doble palomita (mensaje leído)
              size: 14, // Tamaño pequeño
              color: Colors.blue, // Color azul para el ícono
            ),
          ],
        ),
        const SizedBox(height: 5), // Espacio final después de la información
      ],
    );
  }
}
