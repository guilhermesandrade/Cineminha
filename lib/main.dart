import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

String tmdbApiKey = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final jsonString = await rootBundle.loadString('assets/env.json');
  final jsonMap = json.decode(jsonString);
  tmdbApiKey = jsonMap['TMDB_API_KEY'];

  runApp(const CineminhaApp());
}

class CineminhaApp extends StatelessWidget {
  const CineminhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cineminha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212), // ✅ Aqui estava incompleto
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
