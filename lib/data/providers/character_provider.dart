import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/services/api_service.dart';
import 'package:harry_potter_api/data/models/character.dart';

class CharacterProvider extends ChangeNotifier{
  final CharacterService _characterService = CharacterService();
  final List<Character> _characters = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;


  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();
    try {
      final characters = await _characterService.fetchCharacters();
      _characters.addAll(characters);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}