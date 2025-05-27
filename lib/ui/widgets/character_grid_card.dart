import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/models/character.dart';
import 'character_images.dart';

class CharacterGridCard extends StatelessWidget {
  final Character character;

  const CharacterGridCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CharacterImage(
              imageUrl: character.image,
              width: 80,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(
              character.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            if (character.house.isNotEmpty)
              Text('House: ${character.house}', style: const TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('Actor: ${character.actor}', style: const TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('Species: ${character.species}', style: const TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
            if (character.patronus.isNotEmpty)
              Text('Patronus: ${character.patronus}', style: const TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
            if (character.wizard) const Text('🧙 Wizard', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
