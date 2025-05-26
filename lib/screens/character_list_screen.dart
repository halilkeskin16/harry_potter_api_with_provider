import 'package:flutter/material.dart';
import 'package:harry_potter_api/providers/characte_provider.dart';
import 'package:harry_potter_api/widgets/character_images.dart';
import 'package:provider/provider.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CharacterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body:
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: provider.characters.length,
                itemBuilder: (context, index) {
                  final c = provider.characters[index];
                  return ListTile(
                    leading: CharacterImage(imageUrl: c.image, size: 50),
                    
                    title: Text(c.name),
                    subtitle: Text(
                      c.house.isNotEmpty ? c.house : 'Unknown House',
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CharacterProvider>().fetchCharacters(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
