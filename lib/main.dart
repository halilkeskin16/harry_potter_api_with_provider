import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/providers/characte_provider.dart';
import 'package:harry_potter_api/ui/screens/character_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Harry Potter API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharacterListScreen(),
      ),
    );
  }
}