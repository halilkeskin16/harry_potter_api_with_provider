import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/providers/characte_provider.dart';
import 'package:harry_potter_api/ui/widgets/character_images.dart';
import 'package:provider/provider.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterProvider>().fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CharacterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Harry Potter Characters')),
      body:
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.characters.isEmpty
              ? Center(child: Text('No characters found'))
              : RefreshIndicator(
                onRefresh: () async {
                  await provider.fetchCharacters();
                },
                child: ListView.builder(
                  itemCount: provider.characters.length,
                  itemBuilder: (context, index) {
                    final c = provider.characters[index];
                    return ListTile(
                      leading: CharacterImage(
                        imageUrl: c.image,
                        width: 50,
                        height: 70,
                      ),
                      title: Text(c.name, style: const TextStyle(fontSize: 18)),
                      subtitle: Text(c.actor.isNotEmpty ? c.actor : 'No actor available'),
                    );
                  },
                ),
              ),
    );
  }
}
