//Identidad atomica: lo más pequeño de un sistema.

enum FromWho {me, hers}

/// Estados del mensaje
enum MessageStatus {
  sent,      // Mensaje enviado
  delivered, // Mensaje entregado
  read       // Mensaje leído
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;
  final MessageStatus status;


  Message(this.timestamp, this.status , {required this.text, this.imageUrl, required this.fromWho});

  // Getter para verificar si el mensaje ha sido leído
  bool get isRead => status == MessageStatus.read;
}