import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/models/character.dart';
import 'character_images.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterImage(
              imageUrl: character.image,
              width: 60,
              height: 90,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (character.house.isNotEmpty)
                    Text(
                      'House: ${character.house}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  Text('Actor: ${character.actor.isNotEmpty ? character.actor : 'Unknown'}'),
                  Text('Species: ${character.species}'),
                  if (character.patronus.isNotEmpty)
                    Text('Patronus: ${character.patronus}'),
                  if (character.wizard) const Text('🧙 Wizard'),
                  if (!character.alive) const Text('💀 Deceased', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
