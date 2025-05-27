import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/services/api_service.dart';
import 'package:harry_potter_api/data/models/character.dart';

class CharacterProvider extends ChangeNotifier{
  final CharacterService _characterService = CharacterService();
  final List<Character> _characters = [];
  bool _isLoading = false;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;


  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();
    try {
      final characters = await _characterService.fetchCharacters();
      _characters.addAll(characters);
      notifyListeners();
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}