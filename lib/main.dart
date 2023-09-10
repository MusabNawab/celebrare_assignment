import 'package:celebrare/constants/constants.dart';
import 'package:celebrare/presentation/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrare',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.theme),
        // useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          elevation: 5,
          color: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //Main body of App
      home: const HomeScreen(),
    );
  }
}
