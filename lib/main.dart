import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/crypto_viewmodel.dart';
import 'view/crypto_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CryptoViewModel(),
      child: MaterialApp(
        title: 'Cripto Moedas',
        theme: ThemeData.light(), 
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF121212), 
          primaryColor: const Color(0xFFBB86FC), 
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFBB86FC), 
            secondary: Color(0xFF03DAC6), 
            surface: Color(0xFF1E1E1E), 
            onPrimary: Colors.black, 
            onSurface: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color(0xFF121212), 
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color(0xFF1E1E1E),
          ),
        ),
        themeMode: ThemeMode.dark, 
        home: const CryptoListPage(),
      ),
    );
  }
}