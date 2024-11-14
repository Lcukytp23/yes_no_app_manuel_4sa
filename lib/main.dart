import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_manuel_4sa/Presetation/screen/chat/chat_screen.dart';
import 'package:yes_no_app_manuel_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_manuel_4sa/presentation/providers/chat_provider.dart';

// Punto de entrada principal de la aplicación
void main() => runApp(const MyApp());

// Clase principal de la aplicación que extiende StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Uso de MultiProvider para manejar el estado de la aplicación
    return MultiProvider(
      // Lista de proveedores (providers) de estado
      providers: [
        // ChangeNotifierProvider permite usar ChatProvider en toda la aplicación
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      // MaterialApp configura los detalles principales de la aplicación
      child: MaterialApp(
        title: "Yes No App", // Título de la aplicación
        debugShowCheckedModeBanner: false, // Oculta la etiqueta de "Debug" en la esquina superior derecha
        theme: AppTheme(selectedColor: 1).theme(), // Aplica el tema personalizado definido en AppTheme
        home: const ChatScreen() // Pantalla inicial de la aplicación (ChatScreen)
      ),
    );
  }
}
