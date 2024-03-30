import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 57, 47, 68),
    background: const Color.fromARGB(255, 99, 8, 246));

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.background,
          textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
            titleSmall:
                GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
            titleMedium:
                GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
            titleLarge:
                GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
          )),
      home: const PlacesScreen(),
    );
  }
}
